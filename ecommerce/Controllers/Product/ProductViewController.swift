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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        productTableView.reloadData()
        
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

// MARK: - Buy Button Delegate
extension ProductViewController: BuyDelegate {
    func buyButtonPressed() {
        // ALERT
    }
    
    
}

// MARK: - Table View Delegate
extension ProductViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch presenter.dataSource[section] {
        case .image:
            if let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.imageTableViewCell.identifier) as? ImageTableViewCell {
                cell.setUp(imageLink: presenter.currentProduct?.thumbnail)
                return cell
            }
            
        case .buyButton:
            if let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.buyTableViewCell.identifier) as? BuyTableViewCell {
                cell.setUp(delegate: self)
                return cell
            }
            
        case .price:
            if let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.priceTableViewCell.identifier) as? PriceTableViewCell {
                cell.setUp(price: presenter.currentProduct?.price)
                return cell
            }
            
        case .attributes:
            if let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.titleTableViewCell.identifier) as? TitleTableViewCell {
                cell.setUp(text: R.string.localizable.attributes())
                return cell
            }
            
        case .seller:
            if let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.titleTableViewCell.identifier) as? TitleTableViewCell {
                cell.setUp(text: R.string.localizable.seller())
                return cell
            }
            
        default:
            break
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch presenter.dataSource[section] {
        case .image:
            return ImageTableViewCell.height
            
        case .buyButton:
            return BuyTableViewCell.height
            
        case .price, .seller, .attributes:
            return 50
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch presenter.dataSource[section] {
        case .seller:
            return 1
            
        case .attributes:
            return presenter.currentProduct?.attributes.count ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch presenter.dataSource[indexPath.section] {
        case .seller:
            if let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.textTableViewCell.identifier, for: indexPath) as? TextTableViewCell {
                cell.setUp(seller: presenter.currentProduct?.seller, sellerAddres: presenter.currentProduct?.sellerAddres)
                return cell
            }
            
        case .attributes:
            if let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.attributeTableViewCell.identifier, for: indexPath) as? AttributeTableViewCell, let attributesCounter = presenter.currentProduct?.attributes.count {
                let even = indexPath.row % 2 == 0
                cell.setUp(attribute: presenter.currentProduct?.attributes[indexPath.row],
                           alpha: even,
                           first: indexPath.row == 0,
                           last: indexPath.row == (attributesCounter - 1))
                return cell
            }
        default:
            break
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch presenter.dataSource[indexPath.section] {
        case .attributes, .seller, .price:
            return UITableView.automaticDimension
        default:
            return 0
        }
    }
    
    
}
