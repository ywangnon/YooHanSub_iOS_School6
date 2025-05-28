//
//  ViewController.swift
//  URLScheme
//
//  Created by Hansub Yoo on 2018. 3. 16..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        openSetting()
//        openMail()
//        openMessage()
//        openWebsite()
//        openFacebook()
//        openMyApp()
        
        let str = "tel://010-1234-5678"
        let url = URL(string: str)!
        UIApplication.shared.openURL(url)
        
    }
/*
    private func openSetting() {
        guard let settingURL = URL(string: UIApplicationOpenSettingsURLString), UIApplication.shared.canOpenURL(settingURL)
            else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(settingURL)
        } else {
            UIApplication.shared.openURL(settingURL)
        }
    }
    
    private func openMail() {
        let mailURL = URL(string: "mailto://someone@mail.com")!
        if UIApplication.shared.canOpenURL(mailURL) {
            UIApplication.shared.open(mailURL)
        }
    }
    
    private func openMessage() {
        let messageURL = URL(string: "sms:")!
        if UIApplication.shared.canOpenURL(messageURL) {
            UIApplication.shared.open(messageURL)
        }
    }
    
    private func openWebsite() {
        let websiteURL = URL(string: "http://google.com")!
        if UIApplication.shared.canOpenURL(websiteURL) {
            UIApplication.shared.open(websiteURL)
        }
    }
    
    private func openFacebook() {
        let facebookURL = URL(string: "fb://")!
        if UIApplication.shared.canOpenURL(facebookURL) {
            UIApplication.shared.open(facebookURL)
        }
        print(UIApplication.shared.canOpenURL(facebookURL))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func openMyApp() {
        let myAppURL = URL(string: "myApp://")!
        print(UIApplication.shared.canOpenURL(myAppURL))
        if UIApplication.shared.canOpenURL(myAppURL) {
            UIApplication.shared.open(myAppURL)
        }
    }
    

*/
}

