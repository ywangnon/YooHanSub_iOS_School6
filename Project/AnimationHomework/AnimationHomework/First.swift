//
//  ViewController.swift
//  AnimationHomework
//
//  Created by Hansub Yoo on 2018. 3. 20..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var testView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.testView.frame.size.height -= 100
            self.testView.frame.origin.y -= 200
            // 왜 +로는 안되는가?
            self.testView.backgroundColor = UIColor.red
            self.view.backgroundColor = UIColor.yellow
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

