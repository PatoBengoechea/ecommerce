//
//  NoDataAvailableTableViewCell.swift
//  acp
//
//  Created by Patricio Bengoechea on 30/04/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import UIKit

class NoDataAvailableTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        label.set(color: .black, font: .sourceSansProRegular(16))
        label.set(numberOfLines: 2, adjustFont: true)
        label.textAlignment = .center
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(_ text: String) {
        label.text = text
    }

}
