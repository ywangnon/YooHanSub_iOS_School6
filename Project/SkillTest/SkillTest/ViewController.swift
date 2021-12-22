//
//  ViewController.swift
//  SkillTest
//
//  Created by Hansub Yoo on 2018. 2. 7..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vendingSize: CGRect = view.bounds
        let vending: VendingMachineUI = VendingMachineUI(frame: vendingSize)
        view.addSubview(vending)
    }
    
//        //자판기 생성
//        let vendingMachineSize: CGRect = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height)
//        var vending: VendingMachineUI = VendingMachineUI(frame: vendingMachineSize)
//        view.addSubview(vending)

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

