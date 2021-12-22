//
//  ViewController.swift
//  CirclePractice
//
//  Created by Hansub Yoo on 2018. 3. 22..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rectangle: UIButton!
    @IBOutlet weak var squre: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rectangle.layer.cornerRadius = 0.5 * rectangle.frame.width // 25
        squre.layer.cornerRadius = 0.5 * squre.frame.width // 25
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

