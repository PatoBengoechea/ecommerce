//
//  HomeViewController.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 28/07/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    // MARK: - @IBOutlet
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var productsTableView: UITableView!
    @IBOutlet weak var tableViewBottomConstraint: NSLayoutConstraint!
    
    // MARK: - Properties
    var presenter = HomePresenter<HomeViewController>()
    weak var rootDelegate: RootViewControllerDelegate?
    let kfield = "searchField"
    let kcancelbButton = "cancelButton"
    
    // MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(self)
        productsTableView.registerNoDataCellAndLoader()

        customize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        presenter.initialProducts()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        topView.roundCorners(radius: 7, corners: [.bottomLeft, .bottomRight])
        productsTableView.roundCorners(radius: 10)
    }
    
    override func keyboardWillShow(_ keyboardHeight: CGFloat) {
        tableViewBottomConstraint.constant += keyboardHeight
        self.view.layoutIfNeeded()
    }
    
    override func keyboardWillHide(_ keyboardHeight: CGFloat) {
        tableViewBottomConstraint.constant = 0
        self.view.layoutIfNeeded()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let productVC = segue.destination as? ProductViewController, let product = sender as? ProductViewModel {
            productVC.currentProduct = product
        }
    }
    
    // MARK: - Functions
    
    // MARK: - Private Functions
    private func customize() {
        view.backgroundColor = .systemYellow
        
        topView.backgroundColor = .systemYellow
        
        searchBar.backgroundImage = UIImage()
        let field = searchBar.value(forKey: kfield) as? UITextField
        field?.backgroundColor = .white
        field?.borderStyle = .roundedRect
        field?.layer.borderColor = UIColor.lightGray.cgColor
        field?.placeholder = R.string.localizable.searchProducts()
        field?.font = .ralewayMedium(14)
    }
    
}

// MARK: - Home Presenter Delegate
extension HomeViewController: HomePresenterDelegate {
    func onSearchProducts() {
        productsTableView.reloadData()
    }
    
    func startLoading() {
        productsTableView.reloadData()
    }
    
    func finishedLoading() {
        
    }
    
    func onError(message: String) {
        productsTableView.reloadData()
    }
    
}

// MARK: - Table View Delegate
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch presenter.dataSections[section] {
        case .products:
            switch presenter.searchProductsStatus {
            case .loading, .error, .notExecuted:
                return 1
                
            case .successful:
                if presenter.dataProducts.isEmpty {
                    return 1
                } else {
                    return presenter.dataProducts.count
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch presenter.dataSections[indexPath.section] {
        case .products:
            switch presenter.searchProductsStatus {
            case .loading:
                if let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.loaderTableViewCell.identifier, for: indexPath) as? LoaderTableViewCell {
                    cell.setUp()
                    return cell
                }
                
            case .notExecuted, .error:
                if let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.noDataAvailableTableViewCell.identifier, for: indexPath) as? NoDataAvailableTableViewCell {
                    if presenter.searchProductsStatus == .notExecuted {
                        cell.setUp(R.string.localizable.pleaseSearchTheProductsYouWantToBuy())
                    } else {
                        cell.setUp(presenter.messageError)
                    }
                    return cell
                }
                
            case .successful:
                if presenter.dataProducts.isEmpty {
                    return tableView.getNoDataCell(indexPath: indexPath, text: R.string.localizable.weCouldnTFindProductsInThatSearch())
                } else if let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.productTableViewCell.identifier, for: indexPath) as? ProductTableViewCell {
                    cell.setUp(product: presenter.dataProducts[indexPath.row])
                    return cell
                }
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = presenter.dataProducts[indexPath.row]
        performSegue(withIdentifier: R.segue.homeViewController.goToProduct.identifier, sender: product)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch presenter.dataSections[indexPath.section] {
        case .products:
            switch presenter.searchProductsStatus {
            case .loading, .error, .notExecuted:
                return tableView.frame.height
            
            case .successful:
                if presenter.dataProducts.isEmpty {
                    return tableView.frame.height
                } else {
                    return ProductTableViewCell.height
                }
            }
        }
    }
    
}

// MARK: - SearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if !presenter.textToSearch.isEmpty {
            presenter.searchProducts()
        }
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.textToSearch = searchText
        if presenter.textToSearch.isEmpty {
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
        let button = searchBar.value(forKey: kcancelbButton) as? UIButton
        button?.tintColor = .black
        button?.titleLabel?.font = .ralewayMedium(16)
    }
    
}
