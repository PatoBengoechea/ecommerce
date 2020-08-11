//
//  Extensions.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 28/07/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

// MARK: - UI Navigation Controller
public extension UINavigationController {
    
    var root: UIViewController? {
        return viewControllers.first
    }
    
    class func initFrom(_ storyboard: String) -> UINavigationController? {
        return UIStoryboard(name: storyboard, bundle: nil).instantiateInitialViewController() as? UINavigationController
    }
}

// MARK: - UI Font
extension UIFont {
    class func latoRegular(_ size: Int) -> UIFont {
        return UIFont(name: R.font.latoRegular.fontName, size: CGFloat(size)) ?? UIFont.systemFont(ofSize: CGFloat(size))
    }
    
    class func latoBold(_ size: Int) -> UIFont {
        return UIFont(name: R.font.latoBold.fontName, size: CGFloat(size)) ?? UIFont.systemFont(ofSize: CGFloat(size))
    }
    
    class func latoLight(_ size: Int) -> UIFont {
        return UIFont(name: R.font.latoLight.fontName, size: CGFloat(size)) ?? UIFont.systemFont(ofSize: CGFloat(size))
    }
    
}

// MARK: - UI Label
extension UILabel {
    func set(color: UIColor, font: UIFont) {
        self.font = font
        self.textColor = color
    }
    
    func set(numberOfLines number: Int, adjustFont: Bool) {
        self.numberOfLines = number
        self.adjustsFontSizeToFitWidth = adjustFont
    }
}

// MARK: - UI Image View
extension UIImageView {
    func setImageKF(withURL string: String?, placerholder: String = "", showActivityIndicator activity: Bool = true, cacheEnabled: Bool = true, succesCallback: (() -> Void)? = nil, failureCallback: (() -> Void)? = nil) {
        guard let img = string else { return }
        let url = URL(string: img)
        if activity {
            self.kf.indicatorType = .activity
        }
        let placeholderImage = UIImage(named: placerholder)
        var options: KingfisherOptionsInfo = [.transition(.fade(1))]
        if cacheEnabled {
            options.append(.cacheOriginalImage)
        } else {
            options.append(.forceRefresh)
        }
        self.kf.setImage(
            with: url,
            placeholder: placeholderImage,
            options: options) { result in
                switch result {
                case .success:
                    succesCallback?()
                case .failure:
                    failureCallback?()
                }
        }
    }
}

// MARK: - UIView
extension UIView {
    func roundCorners(radius: CGFloat, corners: UIRectCorner) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func roundCorners(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}

// MARK: - UI Table View
extension UITableView {
    func getNoDataCell(indexPath: IndexPath, text: String) -> UITableViewCell {
        if let cell = self.dequeueReusableCell(withIdentifier: R.reuseIdentifier.noDataAvailableTableViewCell.identifier, for: indexPath) as? NoDataAvailableTableViewCell {
            cell.setUp(text)
            return cell
        }
        return UITableViewCell()
    }
    
    func registerNoDataCellAndLoader() {
        let noDataNib = UINib(nibName: R.nib.noDataAvailableTableViewCell.name, bundle: nil)
        self.register(noDataNib, forCellReuseIdentifier: R.reuseIdentifier.noDataAvailableTableViewCell.identifier)
        
        let loadercell = UINib(nibName: R.nib.loaderTableViewCell.name, bundle: nil)
        self.register(loadercell, forCellReuseIdentifier: R.reuseIdentifier.loaderTableViewCell.identifier)
    }
}
