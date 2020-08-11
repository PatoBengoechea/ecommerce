//
//  ErrorViewController.swift
//  acp
//
//  Created by Patricio Bengoechea on 03/06/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {
    
    enum AlertType {
        case message
        case error
    }
    
    // MARK: - @IBOutlet
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var middleView: UIView!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var acceptButton: UIButton!
    
    // MARK: - Properties
    var textButton: String = ""
    var message: String = ""
    var callback: (() -> Void)?
    var titleText: String = ""
    var type: AlertType = .error
    
    // MARK: - @IBAction
    @IBAction func acceptButtonTapped() {
        dismiss(animated: true) {
            self.callback?()
        }
        
    }
    
    @IBAction func tapOutAlert() {
        dismiss(animated: true, completion: nil)
    }

    // MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        customize()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        alertView.roundCorners(radius: 5)
        
    }
    
    // MARK: - Init
    init(alertType: AlertType, title: String, message: String, textButton: String, completion: (() -> Void)? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .overFullScreen
        self.modalTransitionStyle = .crossDissolve
        
        self.type = alertType
        self.titleText = title
        self.textButton = textButton
        self.message = message
        callback = completion
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    func present() {
        if let controller = UIApplication.shared.keyWindow?.rootViewController?.presentedViewController {
            controller.present(self, animated: true, completion: nil)
        } else {
            UIApplication.shared.keyWindow?.rootViewController?.present(self, animated: true, completion: nil)
        }
    }
    
    // MARK: - Private Functions
    private func customize() {
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.9)
        switch type {
        case .error:
            titleLabel.textColor = .systemRed
        case .message:
            titleLabel.textColor = .systemBlue
        default:
            break
        }
        
        titleLabel.text = titleText
        titleLabel.font = .ralewayBold(24)
        
        bodyLabel.set(color: .systemBlue, font: .ralewayMedium(16))
        bodyLabel.adjustsFontSizeToFitWidth = true
        bodyLabel.text = message
        
        acceptButton.titleLabel?.font = .ralewayMedium(16)
        acceptButton.backgroundColor = .systemBlue
        acceptButton.setTitleColor(.white, for: .normal)
        acceptButton.setTitle(textButton, for: .normal)

    }

}
