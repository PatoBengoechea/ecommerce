//
//  ImageTableViewCell.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 09/08/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    // MARK: - @IBOutlet
    @IBOutlet weak var productImageView: UIImageView!
    
    // MARK: - Properties
    static let height: CGFloat = 200

    // MARK: - Override Functions
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // MARK: - Functions
    func setUp(imageLink: String?) {
        productImageView.setImageKF(withURL: imageLink)
    }
}
