//
//  HomeViewController.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 28/07/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - @IBOutlet 

    // MARK: - Properties
    var presenter = HomePresenter<HomeViewController>()
    weak var rootDelegate: RootViewControllerDelegate?
    
    // MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(self)

    }
    
    // MARK: - Functions
    
    // MARK: - Private Functions

}

// MARK: - Home Presenter Delegate
extension HomeViewController: HomePresenterDelegate {
    
}
