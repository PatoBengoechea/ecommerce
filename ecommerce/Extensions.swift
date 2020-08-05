//
//  Extensions.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 28/07/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import Foundation
import UIKit

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
    class func sourceSansProRegular(_ size: Int) -> UIFont {
        return UIFont(name: R.font.sourceSansProRegular.fontName, size: CGFloat(size)) ?? UIFont.systemFont(ofSize: CGFloat(size))
    }
    
    class func sourceSansProBold(_ size: Int) -> UIFont {
        return UIFont(name: R.font.sourceSansProBold.fontName, size: CGFloat(size)) ?? UIFont.systemFont(ofSize: CGFloat(size))
    }
    
    class func sourceSansProLight(_ size: Int) -> UIFont {
        return UIFont(name: R.font.sourceSansProLight.fontName, size: CGFloat(size)) ?? UIFont.systemFont(ofSize: CGFloat(size))
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
