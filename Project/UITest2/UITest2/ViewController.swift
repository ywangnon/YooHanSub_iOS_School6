//
//  ViewController.swift
//  UITest2
//
//  Created by Hansub Yoo on 2018. 2. 2..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var list:[MyCustomView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        var testView: MyCustomView = MyCustomView(frame: CGRect(x: 10, y: 10, width: 150, height: 150))
        //        testView.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside)
        //        view.addSubview(testView)
        
        makeBtn(nums: 7, line: 3, margin: 10)
        
        for a in list{
            print(a.tag)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @objc func btnAction(_ sender: MyCustomView) {
        print("\(sender.tag + 1)를 눌렀다.")
    }
    
    
    func makeBtn(nums: Int, line: Int, margin: CGFloat) {
        
        for num in 0..<nums {
            
            let col: CGFloat = CGFloat(num%line)
            let row: CGFloat = CGFloat(num/line)
            
            let btnWidth: CGFloat = view.frame.size.width/CGFloat(line)
            let margin: CGFloat = margin
            let cgRect: CGRect = CGRect(x: col * btnWidth + margin, y: row * btnWidth + margin, width: btnWidth-margin*2, height: btnWidth-margin*2)
            let testView: MyCustomView = MyCustomView(frame: cgRect)
            testView.title =
            """
            두 줄 이상 넣어야 하니깐
            아무거나
            넣어본다.
            """
            print(num)
            testView.tag = num
            testView.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside)
            list.append(testView)
            view.addSubview(testView)
        }
    }
    
}

