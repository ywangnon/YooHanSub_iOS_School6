//
//  Person.swift
//  Class&StructPractic
//
//  Created by Hansub Yoo on 2018. 1. 23..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import Foundation

/// Person Class
class Person {
    var name: String
    var gender: String
    var major: String
    
    /// 과목 변수: Subject 구조체를 타입으로 하는 변수 생성
    var subjects:[Subject] = []
    
    /// 초기화
    ///
    /// - Parameters:
    ///   - name: 이름
    ///   - gender: 성별
    ///   - major: 전공
    init(name: String, gender: String, major: String) {
        self.name = name
        self.gender = gender
        self.major = major
    }
    
    /// 과목 구조체를 넣는 함수
    ///
    /// - Parameters:
    ///   - subject: 과목 이름
    ///   - score: 과목 점수
    func addSubject(subject: String, score: Int) {
        subjects.append(Subject(name: subject, score: score))
    }
    
    /// 많은 수의 과목을 넣는 함수
    ///
    /// - Parameter subjects: [과목 이름:과목 점수]를 Dictionary형으로 받음
    func addSetSubject(subjects:[String: Int]) {
        
            for sub in subjects
            {
                addSubject(subject: sub.key, score: sub.value)
            }
    }
    
    func getScore(subject: String) -> Int {
        for sub in subjects {
            if sub.name == subject
            {
                return sub.score
            }
        }
        return 0
    }
}
