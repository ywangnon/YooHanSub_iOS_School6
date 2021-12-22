//
//  NextViewController.swift
//  NavigationTest
//
//  Created by Hansub Yoo on 2018. 2. 9..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item: UIBarButtonItem = UIBarButtonItem(title: "ComeBack", style: .done, target: self, action: #selector(back(_:)))
        self.navigationItem.leftBarButtonItem = item
    }

    @objc func back(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
