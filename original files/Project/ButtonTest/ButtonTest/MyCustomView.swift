//
//  MyCustomView.swift
//  ButtonTest
//
//  Created by Hansub Yoo on 2018. 2. 2..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class MyCustomView: UIView {
    
    private var TestView: UIView!
    private var fontLB: UILabel!
    private var fontLB2: UILabel!
    private var imgView: UIImageView!
    private var button: UIButton!
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.blue.cgColor
        
        fontLB = UILabel(frame: CGRect(x: 10, y: 10, width: self.frame.size.width - 20, height: 50))
        fontLB.text = "안녕하세요"
        fontLB.font = UIFont.init(name: "NanumBrushOTF"  , size: 30)
        fontLB.layer.borderColor = UIColor.cyan.cgColor
        fontLB.layer.borderWidth = 1
        fontLB.textAlignment = NSTextAlignment.center
        self.addSubview(fontLB)
        
        fontLB2 = UILabel(frame: CGRect(x: 10, y: 100, width: self.frame.size.width - 20, height: 50))
        fontLB2.text = "Hello, World2"
        fontLB2.font = UIFont.init(name: "Baskerville-BoldItalic" , size: 30)
        fontLB2.layer.borderColor = UIColor.cyan.cgColor
        fontLB2.layer.borderWidth = 1
        fontLB2.textAlignment = NSTextAlignment.center
        self.addSubview(fontLB2)
        
        imgView = UIImageView(frame: CGRect(x: 10, y: 180, width: self.frame.size.width - 20, height: 100))
        imgView.image = UIImage(named: "girlsGeneration.jpg")
        imgView.contentMode = UIViewContentMode.scaleAspectFit
        self.addSubview(imgView)
        
        button = UIButton(frame: CGRect(x: 10, y: 180, width: self.frame.size.width - 20, height: 100))
        button.addTarget(self, action: #selector(btnAction(_:)), for: UIControlEvents.touchUpInside)
        button.alpha = 0.4
        self.addSubview(button)
    }
    
    var title1: String? {
        get {
            return fontLB.text
        }
        set {
            fontLB.text = newValue
        }
    }
    
    var title2: String? {
        get {
            return fontLB2.text
        }
        set {
            fontLB2.text = newValue
        }
    }
    
    @objc func btnAction(_ sender: UIButton) {
        if sender.isSelected == false{
            fontLB.text = "지금은 소녀시대"
            sender.isSelected = true
        }else {
            fontLB.text = "yeah~!"
            sender.isSelected = false
        }
        
    }
    
}
