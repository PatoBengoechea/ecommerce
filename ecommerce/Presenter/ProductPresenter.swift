//
//  ProductPresenter.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 08/08/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import Foundation

protocol ProductPresenterDelegate: BasePresenterDelegate {
    
}

class ProductPresenter<T: ProductPresenterDelegate>: BasePresenter<T> {
    
    enum DataSource {
        case seller
        case attributes
        
    }
    
    // MARK: Properties
    var dataSource: [DataSource] = []
    var currentProduct: ProductViewModel? { didSet { initDataSource()}}
    
    // MARK: - Functions
    func set(currentProduct: ProductViewModel?) {
        guard let product = currentProduct else { return }
    }
    
    func initDataSource() {
//        if currentProduct?.seller != nil { dataSource.append(.seller)}
        if !(currentProduct?.attributes.isEmpty ?? false) { dataSource.append(.attributes)}
    }
    
}
