//
//  ProductManager.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 05/08/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import Foundation

protocol ProductManagerDelegate: BaseManagerDelegate {
    func onSearchProducts(products: [Product])
}

class ProductManager: BaseManager {
    
    // MARK: - Properties
    class var sharedInstance: ProductManager {
        struct Static {
            static let instance = ProductManager()
        }
        return Static.instance
    }
    
    // MARK: - Functions
    func getSearchProducts(delegate: ProductManagerDelegate, forText text: String) {
        delegate.onInitService(.getSearchProducts)
        let request = GetSearchProductRequest(forText: text)
        request.performRequest { (response) in
            if response.status, let products = response.data?.results {
                delegate.onSearchProducts(products: products)
            } else {
                delegate.onError(.getSearchProducts, message: response.message)
            }
            delegate.onFinishService(.getSearchProducts)
        }
    }
}
