//
//  BuyTableViewCell.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 10/08/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import UIKit

protocol BuyDelegate: AnyObject {
    func buyButtonPressed()
}

class BuyTableViewCell: UITableViewCell {
    
    // MARK: - @IBOutlet
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var buyButton: UIButton!

    // MARK: - Properties
    weak var delegate: BuyDelegate?
    static let height: CGFloat = 70
    
    // MARK: - @IBAction
    @IBAction func buyButtonPressed() {
        delegate?.buyButtonPressed()
    }
    
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
    func setUp(delegate: BuyDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Private Functions
    private func customize() {
        buyButton.roundCorners(radius: 10)
        buyButton.backgroundColor = .systemBlue
        buyButton.setTitle(R.string.localizable.buy(), for: .normal)
        buyButton.setTitleColor(.white, for: .normal)
        buyButton.titleLabel?.font = .latoRegular(16)
    }

}
