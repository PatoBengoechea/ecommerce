//
//  Constants.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 05/08/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import Foundation
import UIKit

enum ServiceName: String {
    case getSearchProducts
}

enum ServiceStatus {
    case loading
    case successful
    case error
    case notExecuted
}
