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
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var infoLabel: UILabel!
    
    // MARK: - Properties
    var isFirst = false
    var isLast = false
    
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
    func setUp(attribute: AttributeViewModel?, alpha: Bool, first: Bool, last: Bool) {
        titleLabel.text = attribute?.name
        infoLabel.text = attribute?.value
        if alpha {
            titleView.backgroundColor = UIColor.gray.withAlphaComponent(0.3)
            infoView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        } else {
            titleView.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
            infoView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        }
        DispatchQueue.main.async {
            if first {
                self.titleView.roundCorners(radius: 5, corners: [.topLeft])
                self.infoView.roundCorners(radius: 5, corners: [.topRight])
            }
            if last {
                self.titleView.roundCorners(radius: 5, corners: [.bottomLeft])
                self.infoView.roundCorners(radius: 5, corners: [.bottomRight])
            }
        }
    }
    
    // MARK: - Private Functions
    private func customize() {
        titleLabel.set(color: .black, font: .ralewayBold(12))
        titleLabel.set(numberOfLines: 2, adjustFont: true)
        
        infoLabel.set(color: .black, font: .ralewayMedium(12))
        titleLabel.set(numberOfLines: 2, adjustFont: true)
        
        titleView.backgroundColor = UIColor.gray.withAlphaComponent(0.75)
        titleView.clipsToBounds = true
        
        infoView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.75)
        infoView.clipsToBounds = true
    }
    
}
