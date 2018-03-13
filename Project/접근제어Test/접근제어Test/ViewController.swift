//
//  ViewController.swift
//  접근제어Test
//
//  Created by Hansub Yoo on 2018. 1. 26..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ansLB: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bundle = Bundle.main.bundlePath
        
        ansLB.text = bundle
        print("=====================[bundle Path]=====================")
        print(bundle)
        print("=====================[Home Directory]=====================")
        print(NSHomeDirectory())
//        var proExc: Property.Rect = Property.Rect()
//        proExc.center = Property.Point(x: 3, y: 4)
        
//        print(proExc)
        
//        ansLB.text = String(proExc.center.x)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


