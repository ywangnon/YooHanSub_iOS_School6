//
//  Calculator.swift
//  ClassTest
//
//  Created by youngmin joo on 2018. 1. 22..
//  Copyright © 2018년 youngmin joo. All rights reserved.
//

import Foundation

class Calculator {
 
    //각 평균 구하기
    func average(student:Student) -> Double
    {
        let allSubject:[Subject] = student.subjects
        
        var totalScore:Int = 0
        
        for n in allSubject
        {
            totalScore += n.score
        }
        let average = Double(totalScore) /  Double(allSubject.count)
        return average
    }
    
    
    //가장 싸움을 잘하는 아이는?
    func jjang(_ student:Student...) -> Student?
    {
        var jjang:Student?
        
        for challenger in student
        {
            //과목들 중에서 싸움을 찾아서 싸움의 파워를 가져오기
            if let jjangTmp = jjang
            {
                if jjangTmp.power() < challenger.power()
                {
                    jjang = challenger
                }
            }else
            {
                jjang = challenger
            }
        }
        return jjang
    }
    
    
    //고딩 둘중 수학점수가 높은 아이는?
    func geniusHighSchool(stu1:Student, stu2:Student) -> Student?
    {
        //고등학생인지 확인
        guard stu1.schoolGrade == 2 && stu2.schoolGrade == 2 else {
            return nil
        }
        
        let stu1MathScor = stu1.mathScore ?? 0
        let stu2MathScor = stu2.mathScore ?? 0
        
        return stu1MathScor > stu2MathScor ? stu1 : stu2
        
    }

    
}



//옵셔널 스트링 어레이에 추가 [String?]
//옵셔널 스트링 어레이에서 값 가져오기 [String?]




