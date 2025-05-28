//
//  VendingMachineUI.swift
//  SkillTest
//
//  Created by Hansub Yoo on 2018. 2. 7..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class VendingMachineUI: UIView, DrinkViewDelegate, InputViewDelegate {
    
    var drink: DrinkView?
    var display: DisplayView?
    var input: InputView?

    let margin: CGFloat = 30
    var offSetY: CGFloat = 30
    
    func changeInputText(_ sender: UIButton) {
        
        if sender.tag != 0 {
            display?.resultDisplay?.text = String(sender.tag)+"원 넣었습니다."
            display?.BalanceDisplay?.text = "잔액 : "+String(DisplayView.sum)
        }else
        {
            display?.resultDisplay?.text = String(DisplayView.sum)+"반환하였습니다."
            DisplayView.sum -= DisplayView.sum
            display?.BalanceDisplay?.text = "잔액 : "+String(DisplayView.sum)
        }
    }
    
    func changeDrinkText(_ sender: UIButton) {
        display?.resultDisplay?.text = DrinkView.drinkImgList[sender.tag]+"가 나왔습니다."
        display?.BalanceDisplay?.text = "잔액 : "+String(DisplayView.sum)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createVendingMachine()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createVendingMachine() {
        let drinkSize: CGRect = CGRect(x: 0, y: margin, width: self.bounds.size.width, height: self.bounds.height/6*3)
        drink = DrinkView(frame: drinkSize)
        drink?.delegate = self
        self.addSubview(drink!)
        offSetY += (drink?.bounds.size.height)!
        
        let displaySize: CGRect = CGRect(x: 0, y: offSetY, width: self.bounds.size.width, height: self.bounds.height/6*1)
        display = DisplayView(frame: displaySize)
        self.addSubview(display!)
        offSetY += (display?.bounds.size.height)!
        
        let inputSize: CGRect = CGRect(x: 0, y: offSetY, width: self.bounds.size.width, height: self.bounds.height/6*1)
        input = InputView(frame: inputSize)
        input?.delegate = self
        self.addSubview(input!)
    }
}
//
//    var drinkPad: UIView?
//    var displayPad: UIView?
//    var buttonPad: UIView?
//
//    var resultDisplay: UILabel?
//    var balanceDisplay: UILabel?
//
//    var sum: Int = 0
//
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        createUI()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func createUI() {
//        //드링크 패드
//        let drinkPadSize: CGRect = CGRect(x: 0, y: 50, width: self.bounds.size.width, height: 400)
//        drinkPad = UIView(frame: drinkPadSize)
//        drinkPad?.backgroundColor = .red
//        self.addSubview(drinkPad!)
//
//        //디스플레이 패드
//        let displayPadSize: CGRect = CGRect(x: 0, y: 500, width: self.bounds.size.width, height: 100)
//        displayPad = UIView(frame: displayPadSize)
//        displayPad?.backgroundColor = .blue
//        self.addSubview(displayPad!)
//
//        //버튼 패드
//        let buttonPadSize: CGRect = CGRect(x: 0, y: 650, width: self.bounds.size.width, height: 50)
//        buttonPad = UIView(frame: buttonPadSize)
//        buttonPad?.backgroundColor = .green
//        self.addSubview(buttonPad!)
//
//        //디스플레이 창
//        let resultDisplaySize: CGRect = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: 50)
//        resultDisplay = UILabel(frame: resultDisplaySize)
//        resultDisplay?.text = "결과 Text"
//        resultDisplay?.textAlignment = .right
//        displayPad?.addSubview(resultDisplay!)
//
//        let balanceDisplaySize: CGRect = CGRect(x: 0, y: 50, width: self.bounds.size.width, height: 50)
//        balanceDisplay = UILabel(frame: balanceDisplaySize)
//        balanceDisplay?.text = "잔액 : " + String(sum) + "원"
//        balanceDisplay?.textAlignment = .right
//        displayPad?.addSubview(balanceDisplay!)
//
//        //input button
//        let thousandBtnSize: CGRect = CGRect(x: 0, y: 0, width: 100, height: 50)
//        let thousandBtn: UIButton = UIButton(frame: thousandBtnSize)
//        thousandBtn.setTitle("1000원", for: .normal)
//        thousandBtn.tag = 1000
//        thousandBtn.addTarget(self, action: #selector(inputAction(_:)), for: .touchUpInside)
//        buttonPad?.addSubview(thousandBtn)
//
//        let fivehundredBtnSize: CGRect = CGRect(x: 150, y: 0, width: 100, height: 50)
//        let fivehundredBtn: UIButton = UIButton(frame: fivehundredBtnSize)
//        fivehundredBtn.setTitle("500원", for: .normal)
//        fivehundredBtn.tag = 500
//        fivehundredBtn.addTarget(self, action: #selector(inputAction(_:)), for: .touchUpInside)
//        buttonPad?.addSubview(fivehundredBtn)
//
//        let returnBtnSize: CGRect = CGRect(x: 300, y: 0, width: 100, height: 50)
//        let returnBtn: UIButton = UIButton(frame: returnBtnSize)
//        returnBtn.setTitle("반환", for: .normal)
//        returnBtn.tag = 0
//        returnBtn.addTarget(self, action: #selector(inputAction(_:)), for: .touchUpInside)
//        buttonPad?.addSubview(returnBtn)
//
//        //DrinkBtn1
//        let btnWidth: CGFloat = CGFloat((drinkPad?.bounds.size.width)!/2)
//        let btnHeight: CGFloat = (drinkPad?.bounds.size.height)!/CGFloat(2)
//
//        let drinkViewSize1: CGRect = CGRect(x: 0, y: 0, width: btnWidth, height: btnHeight)
//        let drinkView1: UIView = UIView(frame: drinkViewSize1)
//        drinkPad?.addSubview(drinkView1)
//
//        let drinkImgSize1: CGRect = drinkView1.bounds
//        let drinkImg1: UIImageView = UIImageView(frame: drinkImgSize1)
//        drinkImg1.image = UIImage(named: "사이다.png")
//        drinkView1.addSubview(drinkImg1)
//
//        let drinkBtnLBSize1: CGRect = CGRect(x: 0, y: drinkView1.bounds.height-50, width: drinkView1.bounds.width, height: 50)
//        let drinkBtnLB1: UILabel = UILabel(frame: drinkBtnLBSize1)
//        drinkBtnLB1.text = "1000원"
//        drinkBtnLB1.textAlignment = .right
//        drinkView1.addSubview(drinkBtnLB1)
//
//        let drinkBtnSize1: CGRect = drinkView1.bounds
//        let drinkBtn1: UIButton = UIButton(frame: drinkBtnSize1)
//        drinkBtn1.tag = 1000
//        drinkBtn1.addTarget(self, action: #selector(drinkAction(_:)), for: .touchUpInside)
//        drinkView1.addSubview(drinkBtn1)
//
//        //DrinkBtn2
//        let drinkViewSize2: CGRect = CGRect(x: btnWidth, y: 0, width: btnWidth, height: btnHeight)
//        let drinkView2: UIView = UIView(frame: drinkViewSize2)
//        drinkPad?.addSubview(drinkView2)
//
//        let drinkImgSize2: CGRect = drinkView2.bounds
//        let drinkImg2: UIImageView = UIImageView(frame: drinkImgSize2)
//        drinkImg2.image = UIImage(named: "삼다수.png")
//        drinkView2.addSubview(drinkImg2)
//
//        let drinkBtnLBSize2: CGRect = CGRect(x: 0, y: drinkView2.bounds.height-50, width: drinkView2.bounds.width, height: 50)
//        let drinkBtnLB2: UILabel = UILabel(frame: drinkBtnLBSize2)
//        drinkBtnLB2.text = "800원"
//        drinkBtnLB2.textAlignment = .right
//        drinkView2.addSubview(drinkBtnLB2)
//
//        let drinkBtnSize2: CGRect = drinkView1.bounds
//        let drinkBtn2: UIButton = UIButton(frame: drinkBtnSize2)
//        drinkBtn2.tag = 800
//        drinkBtn2.addTarget(self, action: #selector(drinkAction(_:)), for: .touchUpInside)
//        drinkView2.addSubview(drinkBtn2)
//
//        //DrinkBtn3
//        let drinkViewSize3: CGRect = CGRect(x: 0, y: btnHeight, width: btnWidth, height: btnHeight)
//        let drinkView3: UIView = UIView(frame: drinkViewSize3)
//        drinkPad?.addSubview(drinkView3)
//
//        let drinkImgSize3: CGRect = drinkView3.bounds
//        let drinkImg3: UIImageView = UIImageView(frame: drinkImgSize3)
//        drinkImg3.image = UIImage(named: "칸타타.png")
//        drinkView3.addSubview(drinkImg3)
//
//        let drinkBtnLBSize3: CGRect = CGRect(x: 0, y: drinkView3.bounds.height-50, width: drinkView3.bounds.width, height: 50)
//        let drinkBtnLB3: UILabel = UILabel(frame: drinkBtnLBSize3)
//        drinkBtnLB3.text = "1500원"
//        drinkBtnLB3.textAlignment = .right
//        drinkView3.addSubview(drinkBtnLB3)
//
//        let drinkBtnSize3: CGRect = drinkView1.bounds
//        let drinkBtn3: UIButton = UIButton(frame: drinkBtnSize3)
//        drinkBtn3.tag = 1500
//        drinkBtn3.addTarget(self, action: #selector(drinkAction(_:)), for: .touchUpInside)
//        drinkView3.addSubview(drinkBtn3)
//
//        //DrinkBtn4
//        let drinkViewSize4: CGRect = CGRect(x: btnWidth, y: btnHeight, width: btnWidth, height: btnHeight)
//        let drinkView4: UIView = UIView(frame: drinkViewSize4)
//        drinkPad?.addSubview(drinkView4)
//
//        let drinkImgSize4: CGRect = drinkView1.bounds
//        let drinkImg4: UIImageView = UIImageView(frame: drinkImgSize4)
//        drinkImg4.image = UIImage(named: "콜라.png")
//        drinkView4.addSubview(drinkImg4)
//
//        let drinkBtnLBSize4: CGRect = CGRect(x: 0, y: drinkView4.bounds.height-50, width: drinkView4.bounds.width, height: 50)
//        let drinkBtnLB4: UILabel = UILabel(frame: drinkBtnLBSize4)
//        drinkBtnLB4.text = "500원"
//        drinkBtnLB4.textAlignment = .right
//        drinkView4.addSubview(drinkBtnLB4)
//
//        let drinkBtnSize4: CGRect = drinkView1.bounds
//        let drinkBtn4: UIButton = UIButton(frame: drinkBtnSize4)
//        drinkBtn4.tag = 500
//        drinkBtn4.addTarget(self, action: #selector(drinkAction(_:)), for: .touchUpInside)
//        drinkView4.addSubview(drinkBtn4)
//    }
//
//    //    func createDrinkBtn(num: Int) {
//    //
//    //        let btnWidth: CGFloat = CGFloat((drinkPad?.bounds.size.width)!/2)
//    //        let btnHeight: CGFloat = (drinkPad?.bounds.size.height)!/CGFloat(num/2 + num%2)
//    //         귀찮아진다......
//    //        for number in 0..<num
//    //        {
//    //            let drinkViewSize: CGRect = CGRect(x: , y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
//    //            let drinkView: UIView = UIView(frame: drinkViewSize)
//    //
//    //            let drinkImgSize: CGRect
//    //            let drinkImgView: UIImageView
//    //            drinkImgView.image
//    //            drinkView.addSubview(drinkImgView)
//    //
//    //            let drinkLBSize: CGRect
//    //            let drinkLB: UILabel
//    //            drinkLB.text
//    //            drinkView.addSubview(drinkLB)
//    //
//    //            let drinkBtnSize: CGRect
//    //            let drinkBtn: UIButton
//    //            drinkLB.addSubview(drinkBtn)
//    //        }
//    //    }
//
//    @objc func inputAction(_ sender: UIButton) {
//
//        let btnTag = sender.tag
//
//        switch btnTag {
//        case 1000:
//            sum += 1000
//            resultDisplay?.text = "1000원이 입금 되었습니다."
//            balanceDisplay?.text = "잔액 : " + String(sum)
//        case 500:
//            sum += 500
//            resultDisplay?.text = "500원이 입금 되었습니다."
//            balanceDisplay?.text = "잔액 : " + String(sum)
//        case 0:
//            resultDisplay?.text = String(sum) + "원이 반환 되었습니다."
//            sum -= sum
//            balanceDisplay?.text = "잔액 : " + String(sum)
//        default: break
//        }
//    }
//
//    @objc func drinkAction(_ sender: UIButton) {
//
//        let btnTag: Int = sender.tag
//        if sum>btnTag{
//            switch btnTag {
//            case 1000:
//                sum -= 1000
//                resultDisplay?.text = "사이다가 나왔습니다"
//                balanceDisplay?.text = "잔액 : " + String(sum)
//            case 800:
//                sum -= 800
//                resultDisplay?.text = "삼다수가 나왔습니다"
//                balanceDisplay?.text = "잔액 : " + String(sum)
//            case 1500:
//                sum -= 1500
//                resultDisplay?.text = "칸타타가 나왔습니다"
//                balanceDisplay?.text = "잔액 : " + String(sum)
//            case 500:
//                sum -= 500
//                resultDisplay?.text = "콜라가 나왔습니다"
//                balanceDisplay?.text = "잔액 : " + String(sum)
//            default: break
//            }
//        }else
//        {
//            resultDisplay?.text = "잔액 부족"
//            balanceDisplay?.text = "잔액 : " + String(sum)
//        }
//    }
//}

