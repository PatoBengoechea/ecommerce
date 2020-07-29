//
//  Extensions.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 28/07/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import Foundation
import UIKit

public extension UINavigationController {
    
    var root: UIViewController? {
        return viewControllers.first
    }
    
    class func initFrom(_ storyboard: String) -> UINavigationController? {
        return UIStoryboard(name: storyboard, bundle: nil).instantiateInitialViewController() as? UINavigationController
    }
}
