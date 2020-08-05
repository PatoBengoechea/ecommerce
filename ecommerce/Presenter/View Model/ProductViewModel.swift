//
//  ProductViewModel.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 05/08/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import Foundation


struct ProductViewModel: BaseViewModel {
    typealias T = Product
    
    let id: String
    let title: String
    let price: String
    let thumbnail: String
    let seller: SellerViewModel
    let sellerAddres: SellerAddresViewModel?
    
    init(object: Product) {
        id = object.id ?? ""
        title = object.title ?? ""
        price = object.price == nil ? "---" : "$\(object.price?.description ?? "-")"
        thumbnail = object.thumbnail ?? ""
        seller = SellerViewModel(optional: object.seller) ?? SellerViewModel()
        sellerAddres = SellerAddresViewModel(optional: object.sellerAddres)
    }
}