//
//  FirstSelectViewController.swift
//  controllmemusample
//
//  Created by tatsumi kentaro on 2018/02/23.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import UIKit
import Firebase
import NVActivityIndicatorView

class FirstSelectViewController: UIViewController {
    var handle: AuthStateDidChangeListenerHandle?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
//            if Auth.auth().currentUser != nil{
//                //色々済んだら実装
//                self.segueToMain()
//
//            }else{
//                print("ログインしてね年エネね")
//            }
//        })
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func segueToMain(){
        performSegue(withIdentifier: "GoMainContents", sender: nil)
    }
    
    


}
