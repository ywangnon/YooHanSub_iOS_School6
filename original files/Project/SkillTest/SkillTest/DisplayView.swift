//
//  DisplayView.swift
//  SkillTest
//
//  Created by Hansub Yoo on 2018. 2. 7..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class DisplayView: UIView {
    
    var resultDisplay: UILabel?
    var BalanceDisplay: UILabel?
    static var sum: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createDisplayUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createDisplayUI() {
        let reulstSize: CGRect = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height/2)
        resultDisplay = UILabel(frame: reulstSize)
        guard let result = resultDisplay else {
            return
        }
        self.addSubview(result)
        
        let balanceSize: CGRect = CGRect(x: 0, y: self.bounds.size.height/2, width: self.bounds.size.width, height: self.bounds.size.height/2)
        BalanceDisplay = UILabel(frame: balanceSize)
        guard let balance = BalanceDisplay else {
            return
        }
        self.addSubview(balance)
        
        changeText(result: "결과 Text", balance: DisplayView.sum)
    }
    
    func changeText(result: String, balance: Int) {
        resultDisplay?.text = result
        resultDisplay?.textAlignment = NSTextAlignment.right
        resultDisplay?.font = UIFont.systemFont(ofSize: 30)
        
        BalanceDisplay?.text = "잔액 : " + String(balance) + "원"
        BalanceDisplay?.textAlignment = .right
        BalanceDisplay?.font = UIFont.systemFont(ofSize: 30)
    }
}
