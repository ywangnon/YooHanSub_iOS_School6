//
//  ViewController.swift
//  gpaCalculator
//
//  Created by 김성종 on 2018. 1. 22..
//  Copyright © 2018년 Willicious-k. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let sjk = Student(name:"Will", gender:"M", major:"CS")
        let sjdict = ["Korean":90, "math":85, "english":100, "science": 90]
        sjk.setSubjects(subjectDic: sjdict)
        
        let mhk = Student(name:"mee", gender:"F", major:"Nursing")
        let mhdict = ["korean":90, "math":100, "english":80, "science":80]
        mhk.setSubjects(subjectDic: mhdict)
        
        let jyc = Student(name:"jy", gender:"M", major:"CS")
        let jydict = ["korean":85, "math":95, "english":90, "science":95]
        jyc.setSubjects(subjectDic: jydict)
        
        // 사람 한명의 전체 과목 평균은?
        // 둘중에 수학점수가 더 높은 사람은?
        // 전체 사람중 가장 영어 점수가 높은 사람은? -> Calculator
        
        let calculator = Calculator()
        calculator.calcAverage(of: sjk)
        calculator.whoIsBetterAtMath(op1: mhk, op2: jyc)
        calculator.whoIsBestAtEnglish(sjk, mhk, jyc)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

