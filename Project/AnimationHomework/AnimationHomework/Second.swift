//
//  Second.swift
//  AnimationHomework
//
//  Created by Hansub Yoo on 2018. 3. 21..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class Second: UIViewController {
    var sel: Bool = false
    @IBOutlet weak var btn1Top: NSLayoutConstraint!
    @IBOutlet weak var btn2Top: NSLayoutConstraint!
    @IBOutlet weak var btn3Top: NSLayoutConstraint!
    
    @IBAction func btn0Action(_ sender: UIButton) {
        if sel {
            self.btn1Top.constant = 90
            self.btn2Top.constant = 90
            self.btn3Top.constant = 90
            UIView.animate(withDuration: 7, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
                
                self.view.layoutIfNeeded()
            }, completion: nil)
            sel = false
        } else {
            self.btn1Top.constant = 150
            self.btn2Top.constant = 250
            self.btn3Top.constant = 350
            UIView.animate(withDuration: 7, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
                
                self.view.layoutIfNeeded()
            }, completion: nil)
            sel = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
