//
//  BaseManager.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 05/08/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import Foundation

protocol BaseManagerDelegate: AnyObject {
    func onInitService(_ serviceName: ServiceName)
    func onFinishService(_ serviceName: ServiceName)
    func onError(_ serviceName: ServiceName, message: String)
}

class BaseManager {

}
