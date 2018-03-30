//
//  ThirdViewController.swift
//  controllmemusample
//
//  Created by tatsumi kentaro on 2018/02/23.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import SDWebImage

class ThirdViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    var db1: Firestore!
    var db: DatabaseReference!
    var getmainArray = [StorageReference]()
    var getcontents: String!
    var productArray = [Product]()
    var imagePathArray = [String]()
    var cellOfNum: Int!
    var photoCount: Int!
    let sectionID: Int = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        self.photoCount = appDelegate.photoCount
        print("これは\(self.photoCount)")
        self.mainCollectionView.reloadData()
        productArray = [Product]()
        getmainArray = [StorageReference]()
        imagePathArray = [String]()
        let storage = Storage.storage().reference()
        db1 = Firestore.firestore()
        db1.collection("3").getDocuments { (snap, error) in
            if let error = error{
                print("Error getting documents: \(error)")
            }else{
                for document in snap!.documents {
                    let image1 = document.data()["imagePath"]! as? [String]
                    print(image1![0])
                    print(String(describing: type(of: image1![0])))
                    
                    self.productArray.append(Product(productName: "\(document.data()["productName"] as! String)", productID: "\(document.documentID)", price: "\(document.data()["price"] as! String)", imageArray: image1!, detail: "\(document.data()["detail"] as! String)", uid: "\(document.data()["uid"] as! String)",place: "\(document.data()["place"] as! String)"))
                    
                    
                    self.imagePathArray.append(image1![0])
                    
                    
                }
                print(self.productArray)
                for path in self.imagePathArray{
                    let ref = storage.child("image/goods/\(path)")
                    self.getmainArray.append(ref)
                }
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.productArray = self.productArray
                print("いいね")
                print(self.getmainArray)
                self.mainCollectionView.reloadData()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getmainArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.layer.cornerRadius = 10.0
        cell.layer.masksToBounds = true
        //セルの中にあるimageViewを指定tag = 1
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        imageView.frame.size.width = cell.frame.size.width
        imageView.frame.size.height = cell.frame.size.height/4 * 3
        imageView.layer.cornerRadius = 4
        cell.layer.cornerRadius = 4
        cell.layer.borderColor = UIColor.orange.cgColor
        cell.layer.borderWidth = 1.0
        imageView.layer.masksToBounds = true
        let nameLabel = cell.contentView.viewWithTag(2) as! UILabel
        let priceLabel = cell.contentView.viewWithTag(3) as! UILabel
        let placeLabel = cell.contentView.viewWithTag(4) as! UILabel
        placeLabel.text = productArray[indexPath.row].place
        nameLabel.text = productArray[indexPath.row].productName
        nameLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        priceLabel.text = "¥\(productArray[indexPath.row].price!)"
        //getmainArrayにあるpathをurl型に変換しimageViewに描画
        getmainArray[indexPath.row].downloadURL { url, error in
            if let error = error {
                print(error.localizedDescription)
                // Handle any errors
            } else {
                print(url!)
                //imageViewに描画、SDWebImageライブラリを使用して描画
                imageView.sd_setImage(with: url!, completed: nil)
                
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellSize1:CGFloat = mainCollectionView.frame.size.width/3 - 3
        let cellSize2: CGFloat = mainCollectionView.frame.size.height/3 - 3
        // 正方形で返すためにwidth,heightを同じにする
        return CGSize(width: cellSize1, height: cellSize2)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        cellOfNum = indexPath.row
        appDelegate.cellOfNum = self.cellOfNum
        appDelegate.sectionID = self.sectionID
    }
}
