//
//  PushManager.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 11/08/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import Foundation
import FirebaseMessaging
import UserNotifications

protocol PushManagerDelegate: AnyObject {
    func didRegister()
    func didRegisterForRemoteNotifications(withDeviceToken: Data)
    func didFailToRegisterForRemoteNotifications(withError error: Error)
}

class PushManager: NSObject {
    
    // MARK: - Properties
    class var instance: PushManager {
        struct Static {
            static let sharedManager = PushManager()
        }
        return Static.sharedManager
    }
    
    weak var delegate: PushManagerDelegate?
    var options: UNAuthorizationOptions {
        return [.alert, .badge, .sound]
    }
    var settings: UNAuthorizationOptions {
        return UNAuthorizationOptions([.alert, .badge, .sound])
    }
    
    // MARK: Init
    override init() {
        super.init()
        Messaging.messaging().delegate = self
    }
    
    // MARK: - Functions
    func registerForRemoteNotifications(_ delegate: PushManagerDelegate? = nil) {
        if UIApplication.shared.isRegisteredForRemoteNotifications {
            DispatchQueue.main.async {
                delegate?.didRegister()
            }
        } else {
            self.delegate = delegate
            UNUserNotificationCenter.current().requestAuthorization(options: options, completionHandler: didRegister)
        }
    }
    
    func didRegister(granted: Bool, error: Error?) {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            self.registerForRemoteNotifications(granted: settings.authorizationStatus == .authorized)
        }
    }
    
    func registerForRemoteNotifications(granted: Bool) {
        if granted {
            DispatchQueue.main.async { UIApplication.shared.registerForRemoteNotifications() }
        } else {
            DispatchQueue.main.async {
                self.delegate?.didRegister()
            }
        }
    }
    
    func didRegisterForRemoteNotificationsWithDeviceToken(_ deviceToken: Data) {
        DispatchQueue.main.async {
            self.delegate?.didRegisterForRemoteNotifications(withDeviceToken: deviceToken)
        }
        let tokenString = deviceTokenToString(withData: deviceToken)
        UserDefaults.standard.set(tokenString, forKey: DefaultKey.deviceToken.rawValue)
        
        Messaging.messaging().apnsToken = deviceToken
        registerFirebaseToken()
    }
    
    func didReceiveRemoteNotification(_ userInfo: [AnyHashable: Any]) {
        
    }
    
    func didFailToRegisterForRemoteNotifications(withError error: Error) {
        DispatchQueue.main.async {
            self.delegate?.didFailToRegisterForRemoteNotifications(withError: error)
        }
        UserDefaults.standard.set(error.localizedDescription, forKey: DefaultKey.deviceToken.rawValue)
    }
    
    // MARK: - Private Functions
    private func registerFirebaseToken() {
        if let token = Messaging.messaging().fcmToken {
            Messaging.messaging().subscribe(toTopic: FirebaseNotificationChannel.general.rawValue)
            Messaging.messaging().subscribe(toTopic: FirebaseNotificationChannel.iOS.rawValue)
            
            UserDefaults.standard.set(token, forKey: DefaultKey.firebaseToken.rawValue)
        }
    }
    
    private func deviceTokenToString(withData data: Data) -> String {
        let tokenParts = data.map { data in String(format: "%02.2hhx", data) }
        let token = tokenParts.joined()
        return token
    }
    
}

// MARK: - Messaging Delegate
extension PushManager: MessagingDelegate {

    public func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        registerFirebaseToken()
    }
}
