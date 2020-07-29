//
//  RootViewController.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 28/07/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import UIKit

protocol RootViewControllerDelegate: AnyObject {
    func goToHome()
}

class RootViewController: UIViewController {
    
    // MARK: - Properties
    class var sharedInstance: RootViewController {
        struct Static {
            static let instance = RootViewController()
        }
        return Static.instance
    }
    
    private var _homeNavigationController: UINavigationController?

    var homeNavigationController: UINavigationController {
        if _homeNavigationController == nil {
            _homeNavigationController = UINavigationController.initFrom(R.storyboard.home.name)
            if let nav = _homeNavigationController, let cont = nav.root?.children.last {
                if let homeVC = cont as? HomeViewController {
                    homeVC.rootDelegate = self
                    return nav
                }
            }
        }
        return _homeNavigationController!
    }

    // MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        performSegue(withIdentifier: R.segue.rootViewController.goToSplash, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let splashVC = segue.destination as? SplashViewController {
            splashVC.rootDelegate = self
        }
    }
}

// MARK: - Root Delegate
extension RootViewController: RootViewControllerDelegate {
    func goToHome() {
        UIApplication.shared.windows.first(where: { $0.isKeyWindow})?.rootViewController = homeNavigationController
    }
    
}
