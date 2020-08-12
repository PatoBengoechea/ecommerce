//
//  Seller.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 03/08/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import Foundation

class Seller: NSObject, Codable {
    let id: Int?
    let eshop: EshopSeller?
    let carDealer: Bool?
}
