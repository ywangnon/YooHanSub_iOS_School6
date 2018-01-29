//
//  ViewController.swift
//  CalculatorUI
//
//  Created by Hansub Yoo on 2018. 1. 29..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    func makeScreen(num: Int) -> [UILabel] {
        for number in 0..<num
        {
            let cg: CGRect = CGRect(x: <#T##Int#>, y: <#T##Int#>, width: <#T##Int#>, height: <#T##Int#>)
        }
    }
    
    func makeButton(num: Int, widthNum: Int, heightNum: Int) -> [UIButton] {
        var buttonList:[UIButton] = []
        for number in 0..<num
        {
            let cg: CGRect = CGRect(x: , y: <#T##Int#>, width: <#T##Int#>, height: <#T##Int#>)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

