//
//  SellerViewModel.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 05/08/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import Foundation


struct SellerViewModel: BaseViewModel {
    typealias T = Seller
    
    let id: String
    let powerSellerStatus: String
    let carDealer: Bool
    
    init(object: Seller) {
        id = object.id?.description ?? ""
        powerSellerStatus = object.powerSellerStatus ?? ""
        carDealer = object.carDealer ?? false
    }
    
    init() {
        id = ""
        powerSellerStatus = ""
        carDealer = false
    }
}
