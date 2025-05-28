//
//  AppDelegate.swift
//  KakaoTest
//
//  Created by Hansub Yoo on 2018. 3. 29..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    static var instance: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        initializeApp()
        return true
    }
    
    private func initializeApp() {
        setupSessionChangeNotification()
        setupRootViewController()
    }
    
    private func setupSessionChangeNotification() {
        NotificationCenter.default.addObserver(forName: Notification.Name.KOSessionDidChange, object: nil, queue: .main) { [unowned self] noti in
            guard let session = noti.object as? KOSession else { return }
            session.isOpen() ? print("Login") : print("Logout")
            self.setupRootViewController()
        }
    }
    
    func setupRootViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        
        if KOSession.shared().isOpen() {
            let mainVC = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            navigationController.viewControllers = [mainVC]
        } else {
            let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            navigationController.viewControllers = [loginVC]
        }
        window?.rootViewController = navigationController
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        KOSession.handleDidEnterBackground()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        KOSession.handleDidBecomeActive()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        if KOSession.isKakaoAccountLoginCallback(url) {
            return KOSession.handleOpen(url)
        }
        return false
    }


}

