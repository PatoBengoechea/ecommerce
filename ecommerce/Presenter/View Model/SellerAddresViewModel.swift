//
//  SellerAddresViewModel.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 05/08/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import Foundation

struct SellerAddresViewModel: BaseViewModel {
    typealias T = SellerAddres
    
    let id: String
    let country: String
    let state: String
    let city: String
    var fullAddres: String
    
    init(object: SellerAddres) {
        id = object.id ?? ""
        country = object.country?.name ?? ""
        state = object.state?.name ?? ""
        city = object.city?.name ?? ""
        fullAddres = "\(city), \(state), \(country)"
    }
}
