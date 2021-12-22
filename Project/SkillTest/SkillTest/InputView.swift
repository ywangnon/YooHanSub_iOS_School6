//
//  InputView.swift
//  SkillTest
//
//  Created by Hansub Yoo on 2018. 2. 7..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class InputView: UIView {
    
    var delegate:InputViewDelegate?
    
    var balnceList: [Int] = [1000, 500, 0]
    override init(frame: CGRect) {
        super.init(frame: frame)
        createBtnUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createBtnUI() {
        createInput(num: balnceList.count)
    }
    
    func createInput(num: Int) {
        let btnWidth: CGFloat = self.bounds.size.width/CGFloat(num)
        
        for number in 0..<num
        {
            let btnSize: CGRect = CGRect(x: btnWidth*CGFloat(number), y: 0, width: btnWidth, height: self.bounds.size.height)
            let InputBtn: UIButton = UIButton(frame: btnSize)
            InputBtn.tag = balnceList[number]
            InputBtn.addTarget(self, action: #selector(inputAction(_:)), for: .touchUpInside)
            self.addSubview(InputBtn)
            
            if number != num-1
            {
                InputBtn.setTitle(String(balnceList[number]) + "원", for: .normal)
                InputBtn.setTitleColor(.black, for: .normal)
            }else
            {
                InputBtn.setTitle("반환", for: .normal)
                InputBtn.setTitleColor(.black, for: .normal)
            }
        }
    }
    
    @objc func inputAction(_ sender: UIButton) {
        let btnTag = sender.tag
        if btnTag != 0
        {
            DisplayView.sum += btnTag
        }
        print(DisplayView.sum)
        delegate?.changeInputText(sender)
    }
}

protocol InputViewDelegate: class {
    func changeInputText(_ sender: UIButton)
}
