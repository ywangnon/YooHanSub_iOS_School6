//
//  ViewController.swift
//  aa
//
//  Created by Hansub Yoo on 2018. 3. 9..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let returnValue = function(firstCitizen)
        returnValue()
    }
    
    func firstCitizen() {
        print("function call")
    }

    func function(_ parameter: @escaping () -> ()) -> (() -> ()) {
        return parameter
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

