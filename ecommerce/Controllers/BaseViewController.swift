//
//  BaseViewController.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 05/08/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Properties
    var isVisibleViewController: Bool {
        self.presentedViewController == nil
    }
    
    var isModal: Bool {
        if let index = navigationController?.viewControllers.firstIndex(of: self), index > 0 {
            return false
        } else if presentingViewController != nil {
            return true
        } else if navigationController?.presentingViewController?.presentedViewController == navigationController {
            return true
        } else if tabBarController?.presentingViewController is UITabBarController {
            return true
        } else {
            return false
        }
    }
    
    // MARK: - Override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShowNotification), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHideNotification), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - @objc functions
    @objc private func keyboardWillShowNotification(notification: Notification) {
        if let userInfo = (notification as NSNotification).userInfo {
            if let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as AnyObject? {
                if isVisibleViewController {
                    keyboardWillShow(keyboardFrame.cgRectValue.size.height)
                }
            }
        }
    }
    
    @objc private func keyboardWillHideNotification(notification: Notification) {
        if let userInfo = (notification as NSNotification).userInfo {
            if let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as AnyObject? {
                if isVisibleViewController {
                    keyboardWillHide(keyboardFrame.cgRectValue.size.height)
                }
            }
        }
    }
    
    @objc func close() {
        dismiss()
    }
    
    // MARK: - Functions
    func keyboardWillShow(_ keyboardHeight: CGFloat) {
        self.view.frame.origin.y = 0
        self.view.frame.origin.y -= keyboardHeight/2
        self.view.layoutIfNeeded()
    }
    
    func keyboardWillHide(_ keyboardHeight: CGFloat) {
        self.view.frame.origin.y = 0
        self.view.layoutIfNeeded()
    }
    
    func dismiss() {
        if isModal {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
}
