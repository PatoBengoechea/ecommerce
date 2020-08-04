//
//  ProductRequest.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 04/08/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import Foundation


class GetSearchProductRequest: BaseRequest<Product> {
    
    init(forText text: String) {
        super.init(url: PathBuilder.sharedInstance.searchProducts(forText: text),
                   method: .get)
    }
}
