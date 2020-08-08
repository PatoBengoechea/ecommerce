//
//  ProductTableViewCell.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 05/08/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    // MARK: - @IBOutlet
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var creditCardImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    // MARK: - Properties
    static var height: CGFloat = 150
    
    // MARK: - Override Functions
    override func awakeFromNib() {
        super.awakeFromNib()
        
        customize()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Functions
    func setUp(product: ProductViewModel) {
        productImageView.setImageKF(withURL: product.thumbnail)
        titleLabel.text = product.title
        priceLabel.text = product.price
        if product.acceptMercadoPago {
            creditCardImageView.isHidden = false
        } else {
            creditCardImageView.isHidden = true
        }
    }
    
    // MARK: - Private Functions
    private func customize() {
        titleLabel.set(color: .black, font: .ralewayMedium(16))
        titleLabel.set(numberOfLines: 2, adjustFont: true)
        
        priceLabel.set(color: .black, font: .ralewayBold(18))
        priceLabel.set(numberOfLines: 1, adjustFont: true)
        
        productImageView.contentMode = .scaleToFill
        
        creditCardImageView.contentMode = .scaleToFill
        creditCardImageView.image = R.image.debitCard()
        
    }

}
