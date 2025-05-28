//
//  ViewController.swift
//  DelegateSample
//
//  Created by Hansub Yoo on 2018. 2. 6..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MyCustomViewDelegate, UIScrollViewDelegate {
    
    func didSelectedMyCustomView(view: MyCustomView) {
        print("\(view.tag) button click")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sc: UIScrollView = UIScrollView(frame: view.bounds)
        sc.contentSize = CGSize(width: view.bounds.width*3, height: view.bounds.height)
        sc.isPagingEnabled = true
        view.addSubview(sc)
        
        var cgRect: CGRect = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        var btn: MyCustomView = MyCustomView(frame: cgRect)
        btn.backgroundColor = UIColor.blue
        btn.tag = 1
        btn.delegate = self
        sc.addSubview(btn)
        
        var btn2: MyCustomView = MyCustomView(frame: CGRect(x: view.bounds.width, y: 0, width: view.bounds.width, height: view.bounds.height))
        btn2.backgroundColor = .green
        btn2.delegate = self
        btn2.tag = 2
        sc.addSubview(btn2)
        
        var btn3: MyCustomView = MyCustomView(frame: CGRect(x: view.bounds.width*2, y: 0, width: view.bounds.width, height: view.bounds.height))
        btn3.backgroundColor = .red
        btn3.delegate = self
        btn3.tag = 3
        sc.addSubview(btn3)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
