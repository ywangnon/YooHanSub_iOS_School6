//
//  MyCustomView.swift
//  UITest2
//
//  Created by Hansub Yoo on 2018. 2. 2..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class MyCustomView: UIView {
    
    private var testView: UIView!
    private var imgView: UIImageView!
    private var testLB: UILabel!
    private var testBtn: UIButton!
    
    override var tag: Int {
        set {
            testBtn.tag = newValue
        }
        get {
            return testBtn.tag
        }
    }
    
    var title: String {
        set {
            testLB.text = newValue
        }
        get {
            guard let str = testLB.text else {
                return "title을 입력하세요"
            }
            
            return str
        }
    }
    
    
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createUI() {
        
        //var margin: CGFloat = 15
        
        
        imgView = UIImageView(frame: self.bounds)
        imgView.image = UIImage(named: "GirlsGeneration.jpg")
        self.addSubview(imgView)
        
        testLB = UILabel(frame: self.bounds)
        testLB.text = "Button"
        testLB.textColor = UIColor.blue
        testLB.font = UIFont.systemFont(ofSize: 10)
        testLB.textAlignment = NSTextAlignment.center
        testLB.numberOfLines = 0
        self.addSubview(testLB)
        
        testBtn = UIButton(frame: self.bounds)
        self.addSubview(testBtn)
    }
    
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControlEvents) {
        
        testBtn.addTarget(target, action: action, for: controlEvents)
    }
    
    func setImg(named: String) {
        imgView.image = UIImage(named: named)
    }
    
}
