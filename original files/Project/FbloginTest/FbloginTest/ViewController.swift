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
    
    @IBOutlet var tf: UITextField!
    
    @IBOutlet weak var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let border = CALayer()
        border.borderColor = UIColor.black.cgColor
        let width = CGFloat(2.0)
        border.borderColor = UIColor(red: 55/255, green: 78/255, blue: 95/255, alpha: 1.0).cgColor
        border.frame = CGRect(x: 0, y: tf.frame.size.height-width, width: tf.frame.size.width, height: tf.frame.size.height)
        border.borderWidth = width
        
        tf.layer.addSublayer(border)
        tf.layer.masksToBounds = true
        
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
        
        // custom facebook
        
        let myLoginButton = UIButton(type: .custom)
        myLoginButton.backgroundColor = UIColor.darkGray
        myLoginButton.frame = CGRect(x: 0, y: 0, width: 180, height: 40)
        myLoginButton.setTitle("My Login Button", for: .normal)
        
        // Handle clicks on the button
        myLoginButton.addTarget(self, action: #selector(self.loginButtonClicked ), for: .touchUpInside)
        
        // Add the button to the view
        view.addSubview(myLoginButton)
        
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
    
    // MARK: - custom facebook
    // Once the button is clicked, show the login dialog
    @objc func loginButtonClicked() {
        let loginManager = FBSDKLoginManager()
        loginManager.logIn(withReadPermissions: [], from: self, handler: { (loginResult, error) in
            if error != nil {
                print("\n---------- [ error ] ----------\n")
                print(error?.localizedDescription)
            } else if loginResult!.isCancelled {
                print("\n---------- [ User cancelled log in ] ----------\n")
            } else {
                print("\n---------- [ USER LOGGED IN ] ----------\n")
            }
        }
    )}
}

