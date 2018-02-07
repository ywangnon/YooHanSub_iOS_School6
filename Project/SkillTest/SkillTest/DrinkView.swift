//
//  DrinkView.swift
//  SkillTest
//
//  Created by Hansub Yoo on 2018. 2. 7..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class DrinkView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createDrinkUI() {
        
        
    }
    
    func createDrinkMenu(num: Int, widthNum: Int) {
        
        let lineNumber: CGFloat = CGFloat(num%widthNum + num/widthNum)
        let menuWidth: CGFloat = self.bounds.size.width/CGFloat(widthNum)
        let menuHeight: CGFloat = self.bounds.size.height/lineNumber
        
        for number in 0..<num
        {
            let col: CGFloat = CGFloat(number%widthNum)
            let row: CGFloat = CGFloat(number/widthNum)
            
            let drinkViewSize: CGRect = CGRect(x: menuWidth*col, y: menuHeight*row, width: menuWidth, height: menuHeight)
            let drinkView: UIView = UIView(frame: drinkView)
        }
    }
}

