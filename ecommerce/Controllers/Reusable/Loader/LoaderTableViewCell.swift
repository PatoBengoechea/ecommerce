//
//  LoaderCellTableViewCell.swift
//  acp
//
//  Created by Patricio Bengoechea on 04/05/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import UIKit

class LoaderTableViewCell: UITableViewCell {
    
    // MARK: - @IBOutlet
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    // MARK: - Override Functions
    override func awakeFromNib() {
        super.awakeFromNib()
        
        customize()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp() {
        activityIndicator.startAnimating()
    }
    
    // MARK: - Private Functions
    private func customize() {
        activityIndicator.startAnimating()
        activityIndicator.color = .systemYellow
        selectionStyle = .none
    }

}
