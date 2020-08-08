//
//  Product.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 03/08/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import Foundation

class Product: Codable {
    let id: String?
    let title: String?
    let price: Float?
    let thumbnail: String?
    let attributes: [Attribute]?
    let seller: Seller?
    let sellerAddres: SellerAddres?
    
}
