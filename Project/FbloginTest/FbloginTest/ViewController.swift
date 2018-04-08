//
//  ViewController.swift
//  FbloginTest
//
//  Created by Hansub Yoo on 2018. 4. 8..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController {

    @IBOutlet weak var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let btnFBLogin = FBSDKLoginButton()
        
        btnFBLogin.center = self.view.center
        self.view.addSubview(btnFBLogin)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

