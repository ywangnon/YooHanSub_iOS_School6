//
//  ViewController.swift
//  CalculatorUI
//
//  Created by Hansub Yoo on 2018. 1. 29..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var displayView: UILabel!
    var keyPadView:UIView!
    var etc:UIView!
    var operView:UIView!
    var numberPadView:UIView!
    
    var etcBtnList:[UIButton] = []
    var operBtnList:[UIButton] = []
    var numberBtnList:[UIButton] = []
    
    var arr: Twist = Twist()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createUI()
        updateLayout()

        
//        let btn: UIButton = UIButton()
//        btn.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
//        btn.backgroundColor = .yellow
//        btn.setTitle("버튼이야", for: UIControlState.normal)
//        btn.setTitleColor(UIColor.blue, for: UIControlState.normal)
//        btn.addTarget(self, action: #selector(self.btnAction(_:)), for: UIControlEvents.touchUpInside)
//        view.addSubview(btn)
//
//
//
//        let btn2: UIButton = UIButton()
//        btn2.frame = CGRect(x: 100, y: 300, width: 300, height: 300)
//        btn2.backgroundColor = .black
//        btn2.setTitleColor(.white, for: .normal)
//        btn2.setTitle("이건또", for: .normal)
//        btn2.addTarget(arr, action: #selector(arr.btnAction2(_:)), for: .touchUpInside)
//        view.addSubview(btn2)
    }
    
    @objc func btnAction(_ sender:UIButton) {
        print("action 실행")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //UI 인스턴스 만드는 메소드
    private func createUI()
    {
        //mainView에 추가되는 가장 큰 영역
        displayView = UILabel()
        displayView.text = "0"
        displayView.textColor = UIColor.blue
        displayView.textAlignment = NSTextAlignment.right
        displayView.font = UIFont.systemFont(ofSize: 100)
        view.addSubview(displayView)
        keyPadView = UIView()
        view.addSubview(keyPadView)
        
        //keyPad안의 뷰 영역
        etc = UIView()
        keyPadView.addSubview(etc)
        operView = UIView()
        keyPadView.addSubview(operView)
        numberPadView = UIView()
        keyPadView.addSubview(numberPadView)
        
        displayView.backgroundColor = UIColor.darkGray
        keyPadView.backgroundColor = .black
        etc.backgroundColor = UIColor.red
        operView.backgroundColor = UIColor.blue
        numberPadView.backgroundColor = .yellow
        
        etcBtnList = makeBtn(count: 3)
        let etcStrList = ["C","+/-","%"]
        for num in 0..<etcBtnList.count
        {
            let btn = etcBtnList[num]
            let title: String = etcStrList[num]
            btn.layer.borderWidth = 1
            btn.layer.borderColor = UIColor.white.cgColor
            btn.setTitle(title, for: .normal)
            btn.addTarget(self, action: #selector(self.etcAction(_:)), for: .touchUpInside)
            etc.addSubview(btn)
        }
        operBtnList = makeBtn(count: 5)
        let operStrList = ["/","*","-","+","="]
        for num in 0..<operBtnList.count
        {
            let btn = operBtnList[num]
            let title = operStrList[num]
            btn.layer.borderWidth = 1
            btn.layer.borderColor = UIColor.white.cgColor
            btn.setTitle(title, for: .normal)
            btn.addTarget(self, action: #selector(self.operAction(_:)), for: .touchUpInside)
            operView.addSubview(btn)
        }
        numberBtnList = makeBtn(count: 10)
        let numberStrList = ["1","2","3","4","5","6","7","8","9","0"]
        for num in 0..<numberBtnList.count
        {
            let btn = numberBtnList[num]
            let title = numberStrList[num]
            btn.layer.borderWidth = 1
            btn.layer.borderColor = UIColor.white.cgColor
            btn.addTarget(self, action: #selector(self.btnAction(_:)), for: .touchUpInside)
            btn.setTitle(title, for: .normal)
            numberPadView.addSubview(btn)
        }
    }
    
    @objc func etcAction(_ sender:UIButton ) {
        
    }
    
    @objc func numberAction(_ sender:UIButton ) {
        
    }
    
    @objc func operAction(_ sender:UIButton ) {
        
    }
    
    //입력된 갯수의 버튼을 만드는 함수
    func makeBtn(count: Int) -> [UIButton] {
        
        var UIList:[UIButton] = []
        
        for num in 0..<count
        {
            let btnView:UIButton = UIButton()
            btnView.backgroundColor = UIColor.black
            UIList.append(btnView)
        }
        
        return UIList
    }
    
    func viewColor(num: Int) -> UIColor
    {
        let color = num % 7
        var resultColor: UIColor
        
        switch color {
        case 0:
            resultColor = .red
        case 1:
            resultColor = .orange
        case 2:
            resultColor = .yellow
        case 3:
            resultColor = .green
        case 4:
            resultColor = .blue
        case 5:
            resultColor = .magenta
        case 6:
            resultColor = .purple
        default:
            resultColor = .darkGray
        }
        
        return resultColor
    }
    
    //UI인스턴스 프레임 설정 메소드
    private func updateLayout()
    {
        let topMargin: CGFloat = 100
        let btnWidth:CGFloat = view.frame.size.width / 4
        var offSetY: CGFloat = view.frame.size.height
        
        keyPadView.frame = CGRect(x: 0, y: offSetY - btnWidth * 5, width: view.frame.size.width, height: btnWidth * 5)
        
        offSetY -= keyPadView.frame.size.height
        
        displayView.frame = CGRect(x: 0, y: topMargin, width: view.frame.size.width, height: offSetY - topMargin)
        etc.frame = CGRect(x: 0, y: 0, width: btnWidth * 3, height: btnWidth)
        operView.frame = CGRect(x: btnWidth * 3, y: 0, width: btnWidth, height: btnWidth * 5)
        numberPadView.frame = CGRect(x: 0, y: btnWidth, width: btnWidth * 3, height: btnWidth * 4)
        
        updateBtn(btn: etcBtnList, count: 3, width: btnWidth)
        updateBtn(btn: operBtnList, count: 1, width: btnWidth)
        updateBtn(btn: numberBtnList, count: 3, width: btnWidth)
    }
    
    func updateBtn(btn: [UIView], count: Int, width: CGFloat) {
        
        for num in 0..<btn.count
        {
            let col: CGFloat = CGFloat(num%count)
            let row: CGFloat = CGFloat(num/count)
            
            btn[num].frame = CGRect(x: width * col, y: width * row, width: width, height: width)
        }
    }
    
}

class Twist {
    @objc func btnAction2(_ sender: UIButton) {
        print("action245353 실행")
    }
}
