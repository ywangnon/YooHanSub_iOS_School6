//
//  Third.swift
//  AnimationHomework
//
//  Created by Hansub Yoo on 2018. 3. 20..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

let password = "aaa"
class Third: UIViewController {
    
    @IBOutlet weak var testTextField: UITextField!
    
    @IBAction func failAction(_ sender: Any) {
        let pass = testTextField.text
        testTextField.isSecureTextEntry = true
        if pass == password {
            print("Access")
        } else {
            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0, initialSpringVelocity: 10, options: [.autoreverse], animations: {
                self.testTextField.frame.origin.x -= 5
            })
        }
        self.testTextField.frame.origin.x += 5
    }
    
    func shakeObject(_ object: AnyObject) {
        //        let animation = CABasicAnimation(keyPath: )
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
