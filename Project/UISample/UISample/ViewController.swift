//
//  ViewController.swift
//  UISample
//
//  Created by Hansub Yoo on 2018. 2. 1..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
        let titleLB: UILabel = UILabel(frame: CGRect(x: 0, y: 100, width: view.frame.size.width, height: 150))
        titleLB.text = "Girs' Generation"
        titleLB.textColor = .black
        titleLB.font = UIFont.systemFont(ofSize: 50)
        //글자를 x값의 중간에 나타냄
        titleLB.textAlignment = NSTextAlignment.center
        view.addSubview(titleLB)
        
        let centerLB: UILabel = UILabel(frame: CGRect(x: 20, y: view.frame.size.height/2 - 150, width: view.frame.size.width - 40, height: 100))
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
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

