//
//  Person.swift
//  ClassStructTest
//
//  Created by Hansub Yoo on 2018. 1. 22..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import Foundation

class Person
{
    var name: String
    var gender: String
    var major: String
    
    var subjects: [Subject] = []
    
    init(name: String, gender: String, major: String) {
        self.name = name
        self.gender = gender
        self.major = major
    }
    
    func addSubject(name: String, score: Int)
    {
        subjects.append(Subject(name: name, score: score))
    }
    
    func setSubjects(subjectDic: [String:Int])
    {
        for (subName, subScore) in subjectDic
        {
            addSubject(name: subName, score: subScore)
        }
    }
    
    func getSubjectScore(subject: String) -> Int {
        for sub in subjects {
            if sub.name == subject
            {
                return sub.score
            }
        }
        return -1
    }
}
