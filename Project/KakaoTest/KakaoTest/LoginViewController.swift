//
//  ViewController.swift
//  KakaoTest
//
//  Created by Hansub Yoo on 2018. 3. 29..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBAction private func kakaoLogin(_ sender: UIButton) {
        guard let session = KOSession.shared() else { return }
        
        session.isOpen() ? session.close() : ()
        
        session.open { (error) in
            guard session.isOpen() else {
                error != nil ? print(error!.localizedDescription) : print("Canceled")
                return
            }
            // 1번
            // Session Login 후처리는 KOSessionDidChange Notification을 통해 처리
            
//            2번
//            let appDelegate = UIApplication.shared.delegate as! AppDelegate
//            appDelegate.setupRootViewController()
            
//            3번
//            AppDelegate.instance.setupRootViewController()
        print("Login Success")
        }
        
//        session.open { (error) in
//            guard session.isOpen() else { return }
//
//            error != nil ? print(error!.localizedDescription) : print("Canceled")
//            return
//        }
//        print("Login Success")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

