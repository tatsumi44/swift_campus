//
//  Product.swift
//  controllmemusample
//
//  Created by tatsumi kentaro on 2018/02/26.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import UIKit

class Product {
    
    var productName: String!
    var price: String!
    var imageArray = [String]()
    var detail: String!
    var productID: String!
    var uid: String!
    var photoCount: Int!
    var place: String!
    
    init(productName: String,productID: String,price: String,imageArray: [String],detail: String,uid: String,place: String) {
        self.productName = productName
        self.productID = productID
        self.price = price
        self.imageArray = imageArray
        self.detail = detail
        self.uid = uid
        self.place = place
    }
}
