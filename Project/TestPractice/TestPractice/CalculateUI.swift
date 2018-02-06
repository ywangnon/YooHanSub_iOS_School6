//
//  CalculateUI.swift
//  TestPractice
//
//  Created by Hansub Yoo on 2018. 2. 5..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class CalculateUI: UIView {
    //UI
    var numberUI: UILabel!
    var etcView: UIView!
    var operView: UIView!
    var numberView: UIView!
    //Button
    var etcList: [UIButton] = []
    var operList: [UIButton] = []
    var numList: [UIButton] = []
    //literal
    var btnWidth: CGFloat!
    var margin: CGFloat = 30
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createUI() {
        
        btnWidth = self.bounds.size.width / 4
        
        let labelSize: CGRect = CGRect(x: 0, y: margin, width: self.bounds.size.width, height: self.bounds.size.height-margin-btnWidth*5)
        numberUI = UILabel(frame: labelSize)
        numberUI.text = "0"
        numberUI.textAlignment = .right
        numberUI.font = UIFont.systemFont(ofSize: 30)
        numberUI.textColor = UIColor.cyan
        self.addSubview(numberUI)
        
        let etcSize: CGRect = CGRect(x: 0, y: self.bounds.size.height-btnWidth*5, width: btnWidth*3, height: btnWidth)
        etcView = UIView(frame: etcSize)
        etcView.backgroundColor = UIColor.red
        self.addSubview(etcView)
        
        let operSize: CGRect = CGRect(x: btnWidth*3, y: self.bounds.size.height-btnWidth*5, width: btnWidth, height: btnWidth*5)
        operView = UIView(frame: operSize)
        operView.backgroundColor = UIColor.gray
        self.addSubview(operView)
        
        let numSize: CGRect = CGRect(x: 0, y: self.bounds.size.height-btnWidth*4, width: btnWidth*3, height: btnWidth*4)
        numberView = UIView(frame: numSize)
        numberView.backgroundColor = UIColor.black
        self.addSubview(numberView)
        
        etcList = createBtn(num: 3, widthNum: 3)
        operList = createBtn(num: 5, widthNum: 1)
        numList = createBtn(num: 10, widthNum: 3)
        
        for btn in etcList
        {
            etcView.addSubview(btn)
        }
        for btn in operList
        {
            operView.addSubview(btn)
        }
        for btn in numList
        {
            numberView.addSubview(btn)
        }
    }
    
    func createBtn(num: Int, widthNum: Int) -> [UIButton] {
        
        var result:[UIButton] = []
        
        for number in 0..<num {
            
            let col: CGFloat = CGFloat(number%widthNum)
            let row: CGFloat = CGFloat(number/widthNum)
            
            let cgRect: CGRect = CGRect(x: col*btnWidth, y: row*btnWidth, width: btnWidth, height: btnWidth)
            let btn: UIButton = UIButton(frame: cgRect)
            result.append(btn)
        }
        
        return result
    }
}
