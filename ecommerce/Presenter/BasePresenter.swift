//
//  BasePresenter.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 05/08/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import Foundation

protocol BasePresenterDelegate: AnyObject {
    func startLoading()
    func finishedLoading()
    func onError(message: String)
}

extension BasePresenterDelegate {
    func startLoading() { }
    func finishedLoading() { }
    func onError(message: String) { }
}

protocol BaseViewModel {
    associatedtype T: AnyObject
    init?(optional: T?)
    init(object: T)
    static func array(_ objects: [T]) -> [Self]
}
extension BaseViewModel {
    init?(optional: T?) {
        guard let object = optional else { return nil }
        self.init(object: object)
    }
    static func array(_ objects: [T]) -> [Self] {
        return objects.map { return Self(object: $0) }
    }
}

class BasePresenter<T: BasePresenterDelegate> {
    weak internal var delegate: T?
    
    func attachView(_ view: T) {
        self.delegate = view
    }
}
