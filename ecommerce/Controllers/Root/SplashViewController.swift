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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
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
        activityIndicator.color = .systemBlue
        activityIndicator.startAnimating()
    }

}
