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

enum DefaultKey {
    case deviceToken
    case firebaseToken
    var rawValue: String {
        switch self {
        case .deviceToken: return "device_token"
        case .firebaseToken: return "firebase_token"
        
        }
    }
}

enum FirebaseNotificationChannel {
    case iOS
    case general
    var rawValue: String {
        switch self {
        case .iOS: return "ios"
        case .general: return "general"
        }
    }
}
