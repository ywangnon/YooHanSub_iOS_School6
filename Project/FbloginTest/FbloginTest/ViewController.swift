//
//  ViewController.swift
//  FbloginTest
//
//  Created by Hansub Yoo on 2018. 4. 8..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    @IBOutlet weak var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let btnFBLogin = FBSDKLoginButton()
        btnFBLogin.readPermissions = ["public_profile","email"]
        btnFBLogin.delegate = self
        
        btnFBLogin.center = self.view.center
        self.view.addSubview(btnFBLogin)
        
        if FBSDKAccessToken.current() != nil {
            self.lblStatus.text = "LOGGED IN, \(FBSDKAccessToken.current())"
        } else {
          self.lblStatus.text = "not logged in"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            self.lblStatus.text = error.localizedDescription
        } else if result.isCancelled {
            self.lblStatus.text = "User cancelled log in"
        } else {
            self.lblStatus.text = "USER LOGGED IN"
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        self.lblStatus.text = "User logged out"
    }


}

