//
//  ViewController.swift
//  Class&StructPractic
//
//  Created by Hansub Yoo on 2018. 1. 23..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var compLB: UILabel!
    @IBOutlet weak var averLB: UILabel!
    @IBOutlet weak var maxLB: UILabel!
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        let red: Person = Person(name: "알파", gender: "남성", major: "로봇공학")
        let blue: Person = Person(name: "베타", gender: "여성", major: "권투")
        let green: Person = Person(name: "감마", gender: "남성", major: "댄스")
        
        red.addSetSubject(subjects: ["게임":100, "로봇틱스":90, "스타크래프트":98, "워크래프트":78])
        blue.addSetSubject(subjects: ["게임":98, "수학":28, "영어": 92, "스타크래프트":76])
        green.addSetSubject(subjects: ["댄스":99, "스타크래프트":87, "수학":100])
        
        var averS: String = aver(person: red)
        
        var maxS: String = maxScore(person: red,blue,green, subject: "스타크래프트")
        
        var compS: String = compScore(person1: blue, person2: green, subject: "수학")
        
        compLB.text = compS
        maxLB.text = maxS
        averLB.text = averS
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

