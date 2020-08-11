//
//  TitleTableViewCell.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 08/08/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    
    // MARK: - @IBOutlet
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var label: UILabel!
    
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
    func setUp(text: String) {
        label.text = text
    }
    
    // MARK: - Private Functions
    private func customize() {
        backgroundColor = .white
        
        label.set(color: .black, font: .ralewayBold(18))
        label.set(numberOfLines: 2, adjustFont: true)
        
    }
    

}
