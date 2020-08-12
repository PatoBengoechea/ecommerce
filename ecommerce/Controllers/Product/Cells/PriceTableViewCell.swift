//
//  PriceTableViewCell.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 10/08/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import UIKit

class PriceTableViewCell: UITableViewCell {
    
    // MARK: - @IBOutlet
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
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
    func setUp(price: String?) {
        if price?.isEmpty ?? false{
            titleLabel.text = ""
            valueLabel.text = R.string.localizable.thePriceIsNotAvailable()
        }
        valueLabel.text = price
    }
    
    // MARK: - Private Functions
    private func customize() {
        titleLabel.set(color: .ECBlack, font: .latoRegular(22))
        titleLabel.set(numberOfLines: 1, adjustFont: true)
        titleLabel.text = R.string.localizable.price()
        
        valueLabel.set(color: .ECBlack, font: .latoRegular(22))
        valueLabel.set(numberOfLines: 1, adjustFont: true)
    }

}
