//
//  AttributeViewModel.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 08/08/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import Foundation

struct AttributeViewModel: BaseViewModel {
    typealias T = Attribute
    
    let name: String
    let value: String
    
    init(object: T) {
        name = object.name ?? ""
        value = object.value_name ?? ""
    }
}
