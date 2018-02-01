////
////  ViewController.swift
////  UISample
////
////  Created by Hansub Yoo on 2018. 2. 1..
////  Copyright © 2018년 hansub yoo. All rights reserved.
////
//
//import UIKit
//
//class ViewController: UIViewController {
//
//    var stateTemp: Bool = false
//    var beforeState: UIButton?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//
//        //이미지를 준다.
//        let girlGroupImage: UIImage? = UIImage(named: "소녀시대.jpg")
//
//        let iView: UIImageView = UIImageView(frame: view.frame)
//        iView.contentMode = UIViewContentMode.scaleAspectFit
//        //iView.image = #imageLiteral(resourceName: "GirlsGeneration.jpg") //girlGroupImage
//        iView.image = girlGroupImage
//        view.addSubview(iView)
//
//        //이미지 앞에 투명한 레이블을 주어 신기한 느낌을 준다.
//        let coverView: UIView = UIView(frame: view.frame)
//        coverView.backgroundColor = .black
//        coverView.alpha = 0.3
//        view.addSubview(coverView)
//
//        // 레이블
//        let titleLB: UILabel = UILabel(frame: CGRect(x: 0, y: 30, width: view.frame.size.width, height: 150))
//        titleLB.text = "Girs' Generation"
//        titleLB.textColor = .black
//        titleLB.font = UIFont.systemFont(ofSize: 50)
//        //글자를 x값의 중간에 나타냄
//        titleLB.textAlignment = NSTextAlignment.center
//        view.addSubview(titleLB)
//
//        let centerLB: UILabel = UILabel(frame: CGRect(x: 20, y: 150, width: view.frame.size.width - 40, height: 100))
//        //글자를 나타낸다. 기본적으로 나타내는 뷰 높이의 중간 에 나타나지만, 왼쪽에 붙어서 나타난다.
//        centerLB.text =
//        """
//        소녀시대는 대한민국의 8인조 걸 그룹이다.
//        소녀들이 평정할 시대가 왔다는 의미를 가지고 있다.
//        소녀시대는 2007년 8월 2일 데뷔 싱글 〈다시 만난 세계〉를 발매하고 8월 5일 SBS 《인기가요》를 통해 정식 데뷔하였다.
//        """
//        centerLB.textColor = UIColor.darkGray
//        //글자 크기
//        centerLB.font = UIFont.systemFont(ofSize: 30)
//        //나타내고 싶은 텍스트 라인수
//        centerLB.numberOfLines = 0
//        //글자를 표시하는 방법
//        //byWordWrapping: 단어단위로 나타낸다.
//        //byCharWrapping: 한글자단위로 나타낸다.
//        centerLB.lineBreakMode = NSLineBreakMode.byWordWrapping
//        //centerLB.backgroundColor = UIColor.yellow
//        centerLB.textAlignment = NSTextAlignment.center
//        view.addSubview(centerLB)
//
//        let logoBtn: UIButton = UIButton(type: .custom)
//
//        logoBtn.frame = CGRect(x: 0, y: 250, width: view.frame.size.width, height: 50)
//        logoBtn.setTitle("맞다", for: .normal)
//        logoBtn.setTitleColor(.white, for: .normal)
//        logoBtn.setTitleColor(UIColor.green , for: .selected)
//        logoBtn.titleLabel?.font = UIFont.systemFont(ofSize: 50)
//        logoBtn.tag = 1
//        logoBtn.addTarget(self, action: #selector(self.logoAction(_:)), for: .touchUpInside)
//        view.addSubview(logoBtn)
//
//        let logoBtn2: UIButton = UIButton(type: .custom)
//
//        logoBtn2.frame = CGRect(x: 0, y: 300, width: view.frame.size.width, height: 50)
//        logoBtn2.setTitle("아니다", for: .normal)
//        logoBtn2.setTitleColor(.white, for: .normal)
//        logoBtn2.setTitleColor(.green, for: .selected)
//        logoBtn2.titleLabel?.font = UIFont.systemFont(ofSize: 50)
//        logoBtn2.tag = 2
//        logoBtn2.addTarget(self, action: #selector(self.logoAction(_:)), for: .touchUpInside)
//        view.addSubview(logoBtn2)
//
//        let logoBtn3: UIButton = UIButton(type: .custom)
//
//        logoBtn3.frame = CGRect(x: 0, y: 350, width: view.frame.size.width, height: 50)
//        logoBtn3.setTitle("아니다 9명이다 이 악마야", for: .normal)
//        logoBtn3.setTitleColor(.white, for: .normal)
//        logoBtn3.setTitleColor(.green, for: .selected)
//        logoBtn3.titleLabel?.font = UIFont.systemFont(ofSize: 30)
//        logoBtn3.tag = 3
//        logoBtn3.addTarget(self, action: #selector(self.logoAction(_:)), for: .touchUpInside)
//        view.addSubview(logoBtn3)
//
//        let resultBtn: UIButton = UIButton(type: .custom)
//
//        resultBtn.frame = CGRect(x: 0, y: 450, width: view.frame.size.width, height: 50)
//        resultBtn.setTitle("결과", for: .normal)
//        resultBtn.setTitleColor(UIColor.cyan, for: .normal)
//        resultBtn.addTarget(self, action: #selector(self.resultAction(_:)), for: .touchUpInside)
//        view.addSubview(resultBtn)
//    }
//
//    @objc func logoAction(_ sender: UIButton)
//    {
//        var direction: String = ""
//
//        //        switch sender.tag
//        //        {
//        //        case 1:
//        //            direction += "왼쪽"
//        //        case 2:
//        //            direction += "중간"
//        //        case 3:
//        //            direction += "오른쪽"
//        //        default:
//        //            direction += "오류"
//        //        }
//
//        if sender.isSelected == false
//        {
//            beforeState?.isSelected = false
//            sender.isSelected = true
//            beforeState = sender
//
//            print("\(direction) 깜")
//        }else
//        {
//            sender.isSelected = false
//            beforeState = sender
//
//            print("\(direction) 빡")
//        }
//
//    }
//
//    @objc func resultAction(_ sender: UIButton)
//    {
//        guard let btn = beforeState else {
//            return
//        }
//
//        print(btn.tag)
//    }
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//}

//
//  ViewController.swift
//  UISample
//
//  Created by Hansub Yoo on 2018. 2. 1..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var stateTemp: Bool = false
    var beforeState: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //이미지를 준다.
        let girlGroupImage: UIImage? = UIImage(named: "소녀시대.jpg")
        
        let iView: UIImageView = UIImageView(frame: view.frame)
        iView.contentMode = UIViewContentMode.scaleAspectFit
        //iView.image = #imageLiteral(resourceName: "GirlsGeneration.jpg") //girlGroupImage
        iView.image = girlGroupImage
        view.addSubview(iView)
        
        //이미지 앞에 투명한 레이블을 주어 신기한 느낌을 준다.
        let coverView: UIView = UIView(frame: view.frame)
        coverView.backgroundColor = .black
        coverView.alpha = 0.3
        view.addSubview(coverView)
        
        // 레이블
        let titleLB: UILabel = UILabel(frame: CGRect(x: 0, y: 30, width: view.frame.size.width, height: 150))
        titleLB.text = "Girs' Generation"
        titleLB.textColor = .black
        titleLB.font = UIFont.systemFont(ofSize: 50)
        //글자를 x값의 중간에 나타냄
        titleLB.textAlignment = NSTextAlignment.center
        view.addSubview(titleLB)
        
        let centerLB: UILabel = UILabel(frame: CGRect(x: 20, y: 150, width: view.frame.size.width - 40, height: 100))
        //글자를 나타낸다. 기본적으로 나타내는 뷰 높이의 중간 에 나타나지만, 왼쪽에 붙어서 나타난다.
        centerLB.text =
        """
        소녀시대는 대한민국의 8인조 걸 그룹이다.
        소녀들이 평정할 시대가 왔다는 의미를 가지고 있다.
        소녀시대는 2007년 8월 2일 데뷔 싱글 〈다시 만난 세계〉를 발매하고 8월 5일 SBS 《인기가요》를 통해 정식 데뷔하였다.
        """
        centerLB.textColor = UIColor.darkGray
        //글자 크기
        centerLB.font = UIFont.systemFont(ofSize: 30)
        //나타내고 싶은 텍스트 라인수
        centerLB.numberOfLines = 0
        //글자를 표시하는 방법
        //byWordWrapping: 단어단위로 나타낸다.
        //byCharWrapping: 한글자단위로 나타낸다.
        centerLB.lineBreakMode = NSLineBreakMode.byWordWrapping
        //centerLB.backgroundColor = UIColor.yellow
        centerLB.textAlignment = NSTextAlignment.center
        view.addSubview(centerLB)
        
        let logoBtn: UIButton = UIButton(type: .custom)
        
        logoBtn.frame = CGRect(x: 0, y: 250, width: view.frame.size.width, height: 50)
        logoBtn.setTitle("맞다", for: .normal)
        logoBtn.setTitleColor(.white, for: .normal)
        logoBtn.setTitleColor(UIColor.green , for: .selected)
        logoBtn.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        logoBtn.tag = 1
        logoBtn.addTarget(self, action: #selector(self.logoAction(_:)), for: .touchUpInside)
        view.addSubview(logoBtn)
        
        let logoBtn2: UIButton = UIButton(type: .custom)
        
        logoBtn2.frame = CGRect(x: 0, y: 300, width: view.frame.size.width, height: 50)
        logoBtn2.setTitle("아니다", for: .normal)
        logoBtn2.setTitleColor(.white, for: .normal)
        logoBtn2.setTitleColor(.green, for: .selected)
        logoBtn2.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        logoBtn2.tag = 2
        logoBtn2.addTarget(self, action: #selector(self.logoAction(_:)), for: .touchUpInside)
        view.addSubview(logoBtn2)
        
        let logoBtn3: UIButton = UIButton(type: .custom)
        
        logoBtn3.frame = CGRect(x: 0, y: 350, width: view.frame.size.width, height: 50)
        logoBtn3.setTitle("아니다 9명이다 이 악마야", for: .normal)
        logoBtn3.setTitleColor(.white, for: .normal)
        logoBtn3.setTitleColor(.green, for: .selected)
        logoBtn3.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        logoBtn3.tag = 3
        logoBtn3.addTarget(self, action: #selector(self.logoAction(_:)), for: .touchUpInside)
        view.addSubview(logoBtn3)
        
        let resultBtn: UIButton = UIButton(type: .custom)
        
        resultBtn.frame = CGRect(x: 0, y: 450, width: view.frame.size.width, height: 50)
        resultBtn.setTitle("결과", for: .normal)
        resultBtn.setTitleColor(UIColor.cyan, for: .normal)
        resultBtn.addTarget(self, action: #selector(self.resultAction(_:)), for: .touchUpInside)
        view.addSubview(resultBtn)
    }
    
    @objc func logoAction(_ sender: UIButton)
    {
        let direction: String = ""
        
        if sender.isSelected == false
        {
            sender.isSelected = true
            beforeState.append(sender)
            
            print("\(direction) 깜")
        }else
        {
            sender.isSelected = false
           
            let ind = beforeState.index(of: sender)!
            beforeState.remove(at: ind)
            
            print("\(direction) 빡")
        }
        
    }
    
    @objc func resultAction(_ sender: UIButton)
    {
        
        var result: [Int] = []
        
        for str in beforeState
        {
            result.append(str.tag)
        }
        
        let set:Set<Int> = []
        var str: String = ""
        
        for num in set.union(result).sorted()
        {
            str += String(num) + "번 "
        }
        
        print(str + "입니다.")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

