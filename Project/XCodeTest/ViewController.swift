//
//  ViewController.swift
//  XCodeTest
//
//  Created by Hansub Yoo on 2018. 1. 10..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lb:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("최초의 프린트!!")
        
        print("두번째 프린트!@")
        
        print("세번째 프린트!")
        
        
        print("네번째 프린트!")
        
        lb.backgroundColor = .red
        
    }
    
    
}
