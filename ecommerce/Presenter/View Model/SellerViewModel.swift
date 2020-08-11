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
    let nickName: String
    let carDealer: Bool
    
    init(object: Seller) {
        id = object.id?.description ?? ""
        nickName = object.eshop?.nick_name ?? ""
        carDealer = object.carDealer ?? false
    }
    
}
