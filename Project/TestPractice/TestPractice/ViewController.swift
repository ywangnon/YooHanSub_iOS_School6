//
//  ViewController.swift
//  TestPractice
//
//  Created by Hansub Yoo on 2018. 2. 5..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calSize: CGRect = view.bounds
        var calUI: CalculateUI = CalculateUI(frame: calSize)
        calUI.backgroundColor = UIColor.darkGray
        calUI.createUI()
        view.addSubview(calUI)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

