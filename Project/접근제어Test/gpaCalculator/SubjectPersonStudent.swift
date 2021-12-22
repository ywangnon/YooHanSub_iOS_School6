//
//  PersonSubject.swift
//  gpaCalculator
//
//  Created by 김성종 on 2018. 1. 22..
//  Copyright © 2018년 Willicious-k. All rights reserved.
//

import Foundation

struct Subject {
    var name: String
    var score: Int
}

class Person {
    var name: String
    var gender: String

    init(name:String, gender:String) {
        self.name = name
        self.gender = gender
    }
}

class Student: Person {
    var _major: String
    var major: String?
    {
        set
        {
            guard let x = newValue else {
                return
            }
            
            self._major = x
            
            return
        }
        get
        {
            return self._major
        }
    }
    
    var subjectsDic:[String:Int] = [:]
    var subjects: [Subject]
    {
        set
        {
            for subject in newValue
            {
                self.subjectsDic.updateValue(subject.score, forKey: subject.name)
            }
        }
        get
        {
            var subList: [Subject] = []
            for (name, score) in subjectsDic {
                subList.append(Subject(name: name, score: score))
            }
            return subList
        }
    }
    
    
    init (name: String, gender: String, major: String) {
        self._major = major
        //self.subjects = []
        super.init(name: name, gender: gender) // super.init should be called last
    }
    
    func getScore(of subName: String) -> Int {
        for subject in subjects {
            if (subject.name == subName) {
                return subject.score
            }
        }
        return -1 // if matching fails...
    }
    
    func addSubject(name: String, score:Int) {
        let target: Subject = Subject(name: name, score: score)
        self.subjects.append(target)
    }
    
    func setSubjects(subjectDic:[String:Int] ) {
        for (x, y) in subjectDic {
            self.addSubject(name: x, score: y)
        }
    }
}





