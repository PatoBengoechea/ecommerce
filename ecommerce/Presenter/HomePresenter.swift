//
//  HomePresenter.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 05/08/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import Foundation

protocol HomePresenterDelegate: BasePresenterDelegate {
    func onSearchProducts()
}

class HomePresenter<T: HomePresenterDelegate>: BasePresenter<T> {
    
    enum HomeSections {
        case products
    }
    
    // MARK: - Properties
    var dataSections: [HomeSections] = [.products]
    var dataProducts: [ProductViewModel] = []
    var searchProductsStatus: ServiceStatus = .notExecuted
    var textToSearch: String = ""
    var messageError: String = ""
    
    // MARK: - Functions
    func searchProducts() {
        ProductManager.sharedInstance.getSearchProducts(delegate: self, forText: textToSearch)
    }
}

// MARK: - Product Manager Delegate
extension HomePresenter: ProductManagerDelegate {
    func onSearchProducts(products: [Product]) {
        dataProducts = ProductViewModel.array(products)
        searchProductsStatus = .successful
        delegate?.onSearchProducts()
    }
    
    func onInitService(_ serviceName: ServiceName) {
        switch serviceName {
        case .getSearchProducts:
            searchProductsStatus = .loading
        }
        delegate?.startLoading()
    }
    
    func onFinishService(_ serviceName: ServiceName) {
        delegate?.finishedLoading()
    }
    
    func onError(_ serviceName: ServiceName, message: String) {
        switch serviceName {
        case .getSearchProducts:
            searchProductsStatus = .error
        }
        messageError = message
        delegate?.onError(message: message)
    }
    
    
}
