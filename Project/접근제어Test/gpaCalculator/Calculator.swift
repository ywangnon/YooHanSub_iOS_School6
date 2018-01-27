//
//  Calculator.swift
//  gpaCalculator
//
//  Created by 김성종 on 2018. 1. 22..
//  Copyright © 2018년 Willicious-k. All rights reserved.
//

import Foundation

class Calculator {
    
    // 학생 한명의 전체 과목 평균은?
    func calcAverage(of student:Student) {
        var total = 0

        for subject in student.subjects {
            total += subject.score
        }
        let average: Double = Double(total) / Double(student.subjects.count)
        
        print("average point of \(student.name) is \(average)")
    }
    
    // 둘 중에 수학점수가 더 높은 학생은?
    func whoIsBetterAtMath(op1: Student, op2: Student) {
        if (op1.getScore(of:"math") > op2.getScore(of:"math")) {
            print( "\(op1.name) is better at math than \(op2.name)" )
        } else {
            print( "\(op2.name) is better at math than \(op1.name)" )
        }
    }
    
    // 전체 사람 중 가장 영어 점수가 높은 학생은?
    func whoIsBestAtEnglish(_ students:Student...) {
        var bestStudent: Student? // assign optional or assign the first element
        
        for student in students {
            if (student.getScore(of:"english") > (bestStudent?.getScore(of:"english") ?? 0) ) { // initial case of Loop can be solved this way
                bestStudent = student
            }

        }
        guard let tempName = bestStudent?.name else { // scope difference of binded variables
            print ("perimeter students are empty!, nothing is happened" )
            return
        }
        print ("\(tempName) is best at english") // 옵셔널로 안하면 type inference에 안걸리는 케이스가 있을 수도 있어서 초기화 에러 나옴
    }
}
