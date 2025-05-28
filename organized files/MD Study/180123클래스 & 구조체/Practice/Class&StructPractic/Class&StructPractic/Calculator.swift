//
//  Calculator.swift
//  Class&StructPractic
//
//  Created by Hansub Yoo on 2018. 1. 23..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import Foundation

//과목의 평균을 구하는 함수
func aver(person: Person) -> String
{
    var sum: Int = 0
    var aver: Int = 0
    
    for subject in person.subjects
    {
        sum += subject.score
    }
    
    aver = sum/person.subjects.count
    
    print("\(person.name)의 평균 점수는 \(aver)입니다.")
    return "\(person.name)의 평균 점수는 \(aver)입니다."
}

func maxScore(person: Person..., subject: String) -> String
{
    var max: Int = 0
    var name: String = ""
    
    
    for student in person
    {
        for sub in student.subjects
        {
            if sub.name == subject && sub.score > max
            {
                max = sub.score
                name = student.name
            }
        }
    }
    
    print("\(name)의 \(subject)점수가 가장 높습니다.")
    
    return "\(name)의 \(subject)점수가 가장 높습니다."
}

func compScore(person1: Person, person2: Person, subject: String) -> String
{
    let stu1Score: Int = person1.getScore(subject: subject)
    let stu2Score: Int = person2.getScore(subject: subject)
    
    if stu1Score > stu2Score {
        let diffScore: Int = stu1Score - stu2Score
        print("\(person1.name)의 점수가 \(diffScore)점 더 높습니다.")
        return "\(person1.name)의 점수가 \(diffScore)점 더 높습니다."
    }else if stu2Score > stu1Score {
        let diffScore: Int = stu2Score - stu1Score
        print("\(person2.name)의 점수가 \(diffScore)점 더 높습니다.")
        return "\(person2.name)의 점수가 \(diffScore)점 더 높습니다."
    }else {
        print("점수가 같습니다.")
        return "점수가 같습니다."
    }
    return "오류"
}
