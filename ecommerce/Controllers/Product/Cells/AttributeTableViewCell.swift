//
//  AttributeTableViewCell.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 08/08/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import UIKit

class AttributeTableViewCell: UITableViewCell {
    
    // MARK: - @IBOutlet
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
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
    func setUp(attribute: AttributeViewModel?) {
        titleLabel.text = attribute?.name
        infoLabel.text = attribute?.value
    }
    
    // MARK: - Private Functions
    private func customize() {
        titleLabel.set(color: .black, font: .sourceSansProBold(12))
        titleLabel.set(numberOfLines: 2, adjustFont: true)
        
        infoLabel.set(color: .black, font: .sourceSansProRegular(12))
        titleLabel.set(numberOfLines: 2, adjustFont: true)
    }
    
}
