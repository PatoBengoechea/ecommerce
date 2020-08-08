//
//  ProductViewController.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 08/08/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import UIKit

class ProductViewController: BaseViewController {
    
    // MARK: - @IBOutlet
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTableView: UITableView!

    // MARK: - Properties
    let presenter = ProductPresenter<ProductViewController>()
    var currentProduct: ProductViewModel?
    
    // MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        customize()
        presenter.currentProduct = currentProduct
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
        productTableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        productImageView.setImageKF(withURL: presenter.currentProduct?.thumbnail)
    }
    
    // MARK: - Private Functions
    private func customize() {
        navigationController?.navigationBar.barTintColor = .systemYellow
        navigationController?.navigationBar.tintColor = .black
        
        productTableView.separatorStyle = .none
    }

}

// MARK: - Presenter Delegate
extension ProductViewController: ProductPresenterDelegate {
    func startLoading() {
        
    }
    
    func finishedLoading() {
        
    }
    
    func onError(message: String) {
        
    }
}

// MARK: - Table View Delegate
extension ProductViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch presenter.dataSource[section] {
        case .seller:
            break
        case .attributes:
            if let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.titleTableViewCell.identifier) as? TitleTableViewCell {
                cell.setUp(text: R.string.localizable.attributes())
                return cell
            }
        default:
            break
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch presenter.dataSource[section] {
        case .seller:
            return 50
            
        case .attributes:
            return 50
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch presenter.dataSource[section] {
        case .seller:
            return 1
            
        case .attributes:
            return presenter.currentProduct?.attributes.count ?? 0
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch presenter.dataSource[indexPath.section] {
        case .seller:
            break
        case .attributes:
            if let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.attributeTableViewCell.identifier, for: indexPath) as? AttributeTableViewCell {
                let even = indexPath.row % 2 == 0
                cell.setUp(attribute: presenter.currentProduct?.attributes[indexPath.row],
                           alpha: even,
                           first: indexPath.row == 0,
                           last: indexPath.row == ((presenter.currentProduct?.attributes.count ?? 1) - 1))
                return cell
            }
        default:
            break
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch presenter.dataSource[indexPath.section] {
        case .attributes:
            return UITableView.automaticDimension
        default:
            return 0
        }
    }
    
    
}
