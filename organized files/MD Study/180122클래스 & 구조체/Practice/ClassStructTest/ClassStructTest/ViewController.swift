//
//  ViewController.swift
//  ClassStructTest
//
//  Created by Hansub Yoo on 2018. 1. 22..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let Tyson = Person(name: "타이슨", gender: "남성", major: "컴퓨터")
        let dic = ["국어":80,"수학":100, "싸움":100, "C": 80, "Swift":99]
        Tyson.setSubjects(subjectDic: dic)
        
        let Bill = Person(name: "BillGates", gender: "남성", major: "컴퓨터")
        Bill.setSubjects(subjectDic: ["C":100,"JAVA":99,"OS":98,"싸움":97,"봉사":96,"수학":95])
        
        let Jobs = Person(name: "Steve Jobs", gender: "여", major: "신학")
        Jobs.setSubjects(subjectDic: ["WOW":100,"Diablo3":70,"싸움":80,"수학":70])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

