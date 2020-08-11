//
//  TextTableViewCell.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 09/08/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import UIKit

class SellerViewCell: UITableViewCell {
    
    enum TypeText {
        case addres
        case description
    }
    
    // MARK: - @IBOutlet
    @IBOutlet weak var label: UILabel!

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
    func setUp(text: String, type: TypeText) {
        label.text = text
        switch type {
        case .addres:
            label.set(color: .systemBlue, font: .ralewayMedium(14))
            
        case .description:
            label.set(color: .black, font: .ralewayMedium(14))
            
        default:
            break
        }
    }

}
