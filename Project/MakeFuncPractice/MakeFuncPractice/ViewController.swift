//
//  ViewController.swift
//  MakeFuncPractice
//
//  Created by Hansub Yoo on 2018. 1. 15..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var valueName1: UILabel!
    @IBOutlet weak var valueName2: UILabel!
    @IBOutlet weak var valueName3: UILabel!
    
    @IBAction func figureClick(_ sender: UIButton) {
        let butName = sender.titleLabel!.text!
        
        switch butName {
        case "정사각형":
            valueName1.text = "length"
        default:
            print("오류")
        }
    }
    
    let fgFunc: FigureFunc = FigureFunc()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

