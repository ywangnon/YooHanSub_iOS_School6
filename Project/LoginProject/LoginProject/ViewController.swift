//
//  ViewController.swift
//  LoginProject
//
//  Created by Hansub Yoo on 2018. 2. 20..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var list: [[String:Any]] = []

    var model: UserDataModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var modelList: [UserDataModel] = []
        
        for dic in list
        {
            if let data = UserDataModel(dic: dic)
            {
                modelList.append(data)
            }
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

