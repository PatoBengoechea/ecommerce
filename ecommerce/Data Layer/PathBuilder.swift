//
//  PathBuilder.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 03/08/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import Foundation


class PathBuilder {
    
    class var sharedInstance: PathBuilder {
        struct Static {
            static let instance = PathBuilder()
        }
        return Static.instance
    }
    
    func searchProducts(forText text: String) -> String {
        return "https://api.mercadolibre.com/sites/MLA/search?q=\(text)"
    }
}
