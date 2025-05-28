//
//  AppDelegate.swift
//  DocumentInteractionViewController
//
//  Created by giftbot on 2018. 3. 2..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    //  window = UIWindow(frame: UIScreen.main.bounds)
    //  window?.backgroundColor = .white
    //  window?.rootViewController = ViewController()
    //  window?.makeKeyAndVisible()
    return true
  }

  func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
    print("\n-------------------- [ open url ] --------------------\n")
    print(url)
    print(options[.openInPlace])
    print(options[.sourceApplication])
    return true
  }

}
//<key>CFBundleDocumentTypes</key>
//<array>
//<dict>
//<key>CFBundleTypeName</key>
//<string>All Document Types</string>
//<key>LSHandlerRank</key>
//<string>Default</string>
//<key>LSItemContentTypes</key>
//<array>
//<string>public.item</string>
//</array>
//</dict>
//</array>

