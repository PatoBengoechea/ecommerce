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
        case image
        case title
        case seller
        case buyButton
        case attributes
        case price
        
    }
    
    // MARK: Properties
    var dataSource: [DataSource] = []
    var currentProduct: ProductViewModel? { didSet { initDataSource()}}
    
    // MARK: - Functions
    func initDataSource() {
        if currentProduct?.thumbnail != nil { dataSource.append(.image)}
        dataSource.append(.title)
        dataSource.append(.buyButton)
        dataSource.append(.price)
        dataSource.append(.seller)
        if !(currentProduct?.attributes.isEmpty ?? false) { dataSource.append(.attributes)}
    }
    
}
