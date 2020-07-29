//
//  RootViewController.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 28/07/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import UIKit

protocol RootViewControllerDelegate {
    
}

class RootViewController: UIViewController {
    
    class var sharedInstance: RootViewController {
        struct Static {
            static let instance = RootViewController()
        }
        return Static.instance
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

}
