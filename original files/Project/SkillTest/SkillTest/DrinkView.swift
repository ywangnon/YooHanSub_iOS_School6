//
//  DrinkView.swift
//  SkillTest
//
//  Created by Hansub Yoo on 2018. 2. 7..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class DrinkView: UIView {
    
    var delegate: DrinkViewDelegate?
    static var drinkImgList: [String] = ["사이다", "삼다수", "칸타타", "콜라"]
    static var drinkPriceList: [Int]  = [1000, 800, 1500, 500]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createDrinkUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createDrinkUI() {
        
        createDrinkMenu(num: DrinkView.drinkImgList.count, widthNum: 2)
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
            let drinkView: UIView = UIView(frame: drinkViewSize)
            self.addSubview(drinkView)
            
            let drinkImgSize: CGRect = drinkView.bounds
            let drinkImg: UIImageView = UIImageView(frame: drinkImgSize)
            drinkImg.image = UIImage(named: DrinkView.drinkImgList[number] + ".png")
            drinkView.addSubview(drinkImg)
            
            let drinkLabelSize: CGRect = CGRect(x: 0, y: drinkView.bounds.size.height-50, width: drinkView.bounds.size.width, height: 50)
            let drinkLabel: UILabel = UILabel(frame: drinkLabelSize)
            drinkLabel.text = String(DrinkView.drinkPriceList[number]) + "원"
            drinkLabel.textAlignment = .right
            drinkLabel.font = UIFont.systemFont(ofSize: 20)
            drinkView.addSubview(drinkLabel)
            
            let drinkBtnSize: CGRect = drinkView.bounds
            let drinkBtn: UIButton = UIButton(frame: drinkBtnSize)
            drinkBtn.tag = number
            drinkBtn.addTarget(self, action: #selector(drinkAction(_:)), for: .touchUpInside)
            drinkView.addSubview(drinkBtn)
        }
    }
    
    @objc func drinkAction(_ sender: UIButton) {
        if DisplayView.sum > DrinkView.drinkPriceList[sender.tag]{
            DisplayView.sum -= DrinkView.drinkPriceList[sender.tag]
        }else
        {
            print("금액 부족", terminator: " ")
        }
        print(DisplayView.sum)
        delegate?.changeDrinkText(sender)
    }
}

protocol DrinkViewDelegate: class {
    func changeDrinkText(_ sender: UIButton)
}

