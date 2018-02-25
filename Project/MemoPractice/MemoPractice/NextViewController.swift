//
//  NextViewController.swift
//  MemoPractice
//
//  Created by Hansub Yoo on 2018. 2. 25..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    @IBOutlet var NextViewTextField: UITextField?
    @IBAction  func NextViewBtnAction(_ sender: UIButton) {
        print("nextBtn")
        NotificationCenter.default.post(name: Notification.Name(rawValue: key), object: NextViewTextField?.text)
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
