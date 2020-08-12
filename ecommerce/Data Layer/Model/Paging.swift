//
//  Paging.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 03/08/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import Foundation

class Paging: NSObject, Codable {
    let total: Int?
    let offset: Int?
    let limit: Int?
    let primaryResults: Int?
}
