/**
 * Copyright 2015-2018 Kakao Corp.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?
    var loginViewController: UIViewController?
    var mainViewController: UIViewController?
    
    var deviceToken: Data? = nil
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        setupEntryController()
        setupPushNotification()
        
        // 로그인,로그아웃 상태 변경 받기
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(AppDelegate.kakaoSessionDidChangeWithNotification),
                                               name: NSNotification.Name.KOSessionDidChange,
                                               object: nil)
        
        // 클라이언트 시크릿 설정
        KOSession.shared().clientSecret = SessionConstants.clientSecret;
        
        reloadRootViewController()

        return true
    }
    
    fileprivate func setupEntryController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyboard.instantiateViewController(withIdentifier: "navigator") as! UINavigationController
        let navigationController2 = storyboard.instantiateViewController(withIdentifier: "navigator") as! UINavigationController
        
        let viewController = storyboard.instantiateViewController(withIdentifier: "login") as UIViewController
        navigationController.pushViewController(viewController, animated: true)
        self.loginViewController = navigationController
        
        let viewController2 = storyboard.instantiateViewController(withIdentifier: "main") as UIViewController
        navigationController2.pushViewController(viewController2, animated: true)
        self.mainViewController = navigationController2
    }
    
    fileprivate func reloadRootViewController() {
        let isOpened = KOSession.shared().isOpen()
        if !isOpened {
            let mainViewController = self.mainViewController as! UINavigationController
            mainViewController.popToRootViewController(animated: true)
        }
        
        self.window?.rootViewController = isOpened ? self.mainViewController : self.loginViewController
        self.window?.makeKeyAndVisible()
    }
    
    @objc func kakaoSessionDidChangeWithNotification() {
        reloadRootViewController()
    }
    
    func setupPushNotification() {
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if let error = error as NSError? {
                print("APNS Authorization failure. \(error)")
            } else {
                print("APNS Authorization success.")
            }
        }
        UIApplication.shared.registerForRemoteNotifications()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("The notification \"\(notification.request.identifier)\" is presenting. \"\(notification.request.content.body)\"")
        completionHandler([.alert, .badge, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("The user responded to the notification \"\(response.notification.request.identifier)\" at \"\(response.notification.date.description(with: .current))\".")
        UIApplication.shared.applicationIconBadgeNumber = 0
        completionHandler()
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        if KOSession.handleOpen(url) {
            return true
        }
        return false
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any]) -> Bool {
        if KOSession.handleOpen(url) {
            return true
        }
        return false
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        KOSession.handleDidEnterBackground()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        KOSession.handleDidBecomeActive()
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        self.deviceToken = deviceToken
        var hexString: String = ""
        for byte in deviceToken {
            hexString.append(String(Int(byte), radix: 16))
        }
        print("didRegisterForRemoteNotificationsWithDeviceToken=\(hexString)")
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("didFailToRegisterForRemoteNotificationsWithError=\(error)")
    }
    
    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        MapleBaconStorage.sharedStorage.clearMemoryStorage()
    }
}

