//
//  SellerAddres.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 03/08/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import Foundation

class SellerAddres: Codable {
    let id: String?
    let country: AddresDescription?
    let state: AddresDescription?
    let city: AddresDescription?
    
    
    struct AddresDescription: Codable {
        let id: String?
        let name: String?
    }
}
