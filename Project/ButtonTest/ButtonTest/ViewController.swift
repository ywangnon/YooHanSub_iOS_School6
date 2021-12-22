//
//  ViewController.swift
//  ButtonTest
//
//  Created by Hansub Yoo on 2018. 2. 2..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    var TestView: UIView!
//    var fontLB: UILabel!
//    var fontLB2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        TestView = UIView(frame: CGRect(x: 50, y: 50, width: view.frame.size.width - 100, height: 300))
//        TestView.layer.borderWidth = 1
//        TestView.layer.borderColor = UIColor.blue.cgColor
//        view.addSubview(TestView)
//
//        fontLB = UILabel(frame: CGRect(x: 10, y: 10, width: TestView.frame.size.width - 20, height: 50))
//        fontLB.text = "안녕하세요"
//        fontLB.font = UIFont.init(name: "NanumBrushOTF"  , size: 30)
//        fontLB.layer.borderColor = UIColor.cyan.cgColor
//        fontLB.layer.borderWidth = 1
//        fontLB.textAlignment = NSTextAlignment.center
//        TestView.addSubview(fontLB)
//
//        fontLB2 = UILabel(frame: CGRect(x: 10, y: 100, width: TestView.frame.size.width - 20, height: 50))
//        fontLB2.text = "Hello, World2"
//        fontLB2.font = UIFont.init(name: "Baskerville-BoldItalic" , size: 30)
//        fontLB2.layer.borderColor = UIColor.cyan.cgColor
//        fontLB2.layer.borderWidth = 1
//        fontLB2.textAlignment = NSTextAlignment.center
//        TestView.addSubview(fontLB2)
        
        var testView = MyCustomView(frame: CGRect(x: 50, y: 50, width: view.frame.size.width-100, height: 400))
        testView.title1 = "Hi"
        testView.title2 = "다시 만난 세계"
        view.addSubview(testView)
        
        
        
//        printAllFontName()
    }
    
//    func printAllFontName() {
//        let familyNames = UIFont.familyNames
//        for fn in familyNames
//        {
//            print("===\(fn)===")
//
//            let fontNames = UIFont.fontNames(forFamilyName: fn)
//            for fontName in fontNames
//            {
//                print(">>\(fontName)")
//            }
//        }
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

