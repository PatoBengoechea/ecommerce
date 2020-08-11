//
//  TextTableViewCell.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 09/08/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell {
    
    // MARK: - @IBOutlet
    @IBOutlet weak var label: UILabel!

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
    func setUp(seller: SellerViewModel?, sellerAddres: SellerAddresViewModel?) {
        if seller == nil, sellerAddres == nil {
            label.text = R.string.localizable.theSellerInformationIsNotAvailable()
        } else {
            label.text = "\(seller?.nickName ?? "")  \(sellerAddres?.fullAddres ?? "")"
        }
        
    }
    
    // MARK: - Private Functions
    private func customize() {
        label.set(numberOfLines: 3, adjustFont: true)
        label.set(color: .systemBlue, font: .ralewayMedium(14))
    }

}
