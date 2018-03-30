//
//  CategorySelectViewController.swift
//  controllmemusample
//
//  Created by tatsumi kentaro on 2018/02/24.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import UIKit

class CategorySelectViewController: UIViewController {
    
    var categorynum: Int!
    var window: UIWindow?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "カテゴリー選択"
        let navigationItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = navigationItem
        
       

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectButton(sender: UIButton){
        categorynum = sender.tag
        performSegue(withIdentifier: "productContribution", sender: nil)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let productContoributionContoroller = segue.destination as! ProductContoributionViewController
        productContoributionContoroller.categorynum = self.categorynum
        
    }


    
 

}
