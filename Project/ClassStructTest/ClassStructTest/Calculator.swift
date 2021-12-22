//
//  Calculator.swift
//  ClassStructTest
//
//  Created by Hansub Yoo on 2018. 1. 22..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import Foundation

class Calculator
{
    //각 평균 구하기
    func average(student: Person)
    {
        var aver: Double = 0
        var sum: Int = 0
        
        for subject in student.subjects
        {
            sum += subject.score
        }
        
        aver = Double(sum)/Double(student.subjects.count)
        
        print("\(student.name)의 전공은 \(student.major)이고, 평균은 \(aver)입니다.")
    }
    
    //싸움을 가장 잘하는 아이
    func jjang(_ student:Person...)
    {
        var name: String = ""
        var score: Int = 0
        
        
        
        for person in student {
            
            for subject in person.subjects
            {
                if subject.name == "싸움" && subject.score > score
                {
                    score = subject.score
                    name = person.name
                }
            }
        }
        
        print("싸움을 가장 잘하는 사람은 \(name)입니다.")
    }
    
    func genius(stu1:Person, stu2:Person)
    {
        let stu1MathScore: Int = stu1.getSubjectScore(subject: "수학")
        let stu2MathScore: Int = stu2.getSubjectScore(subject: "수학")
        var diffScore: Int = 0
        var name: String = ""
        
        if stu1MathScore > stu2MathScore
        {
            name = stu1.name
            diffScore = stu1MathScore - stu2MathScore
        }else
        {
            name = stu2.name
            diffScore = stu2MathScore - stu1MathScore
        }
        
        print("\(name)의 수학점수가 \(diffScore)점 더 높습니다.")
    }
}
