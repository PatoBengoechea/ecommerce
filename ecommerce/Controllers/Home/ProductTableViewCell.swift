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
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var prizeLabel: UILabel!

    // MARK: - Properties
    
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
    
    // MARK: - Private Functions
    private func customize() {
        titleLabel.set(color: .black, font: .sourceSansProRegular(12))
        titleLabel.set(numberOfLines: 2, adjustFont: true)
        
        prizeLabel.set(color: .black, font: .boldSystemFont(ofSize: 14))
        prizeLabel.set(numberOfLines: 1, adjustFont: true)
        
        productImageView.contentMode = .scaleToFill
    }

}
