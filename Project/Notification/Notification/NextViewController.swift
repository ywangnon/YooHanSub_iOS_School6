//
//  NextViewController.swift
//  Notification
//
//  Created by Hansub Yoo on 2018. 2. 23..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var tf: UITextField!
    
    @IBAction func btn(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "notiKey"), object: tf.text)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

        
    }

}
