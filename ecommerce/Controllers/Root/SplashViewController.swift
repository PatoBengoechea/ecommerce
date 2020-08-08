//
//  SplashViewController.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 28/07/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    // MARK: - @IBOutlet
    @IBOutlet weak var controllerView: UIView!
    @IBOutlet weak var shopImageView: UIImageView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    // MARK: - Properties
    weak var rootDelegate: RootViewControllerDelegate?

    // MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        customize()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.rootDelegate?.goToHome()
        }
        
    }
    
    // MARK: - Private Functions
    private func customize() {
        controllerView.backgroundColor = UIColor.systemYellow.withAlphaComponent(1)
        
        shopImageView.image = R.image.shop()
        
        loader.startAnimating()
    }

}
