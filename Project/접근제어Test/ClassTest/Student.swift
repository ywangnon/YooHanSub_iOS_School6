//
//  Student.swift
//  ClassTest
//
//  Created by youngmin joo on 2018. 1. 23..
//  Copyright © 2018년 youngmin joo. All rights reserved.
//

import Foundation

class Student:Person
{
    //초 = 0, 중 = 1, 고 = 2, 대 = 3
    var schoolGrade:Int {
        willSet{
            if newValue == 3
            {
                isUniversityStudent = true
            }else
            {
                isUniversityStudent = false
            }
        }
    }
    
    //학년
    var grade:Int
    
    //과목들
    var subjectsDic:[String:Int] = [:]
    var subjects:[Subject]
    {
        get{
            var returnValue:[Subject] = []
            for (name,score) in subjectsDic
            {
                returnValue.append(Subject(name: name, score: score, isHasGrade: false))
            }
            
            return returnValue
        }
        
        set{
            subjectsDic = [:]
            for subject in newValue
            {
               subjectsDic.updateValue(subject.score, forKey: subject.name)
            }
        }
    }
    
    //대학생 전공
    private var _major:String?
    
    var major:String?{
        get{
            return _major
        }
        set{
            if isUniversityStudent
            {
                if major == nil
                {
                    _major = newValue
                }
                
            }
            _major = nil
        }
    }
    
    var mathScore:Int?{
        
        for subject in subjects
        {
            if subject.name == "수학"
            {
                return subject.score
            }
        }
        return nil
    }
    
    private var isUniversityStudent:Bool = false
    
    init(name:String, gender:String, schoolGrade:Int, grade:Int) {
        self.schoolGrade = schoolGrade
        self.grade = grade
        if schoolGrade == 3
        {
            isUniversityStudent = true
        }
        super.init(name: name, gender: gender)
    }
    
    convenience init(name:String, gender:String, schoolGrade:Int, grade:Int, blood:String) {
        self.init(name: name, gender: gender, schoolGrade: schoolGrade, grade: grade)
        self.blood = blood
    }
    
//    func addSubject(name:String, score:Int)
//    {
//        subjects.append(Subject(name: name, score: score, isHasGrade:  isUniversityStudent))
//    }
    
    func findSubject(name:String) -> Subject?
    {
        for subject in subjects
        {
            if subject.name == name
            {
                return subject
            }
        }
        return nil
    }
    
    
    /// 전공과목 설정(대학생 전용)
    /// 한번만 설정 가능하다.
    ///
    /// - Parameter newMajor: 전공과목 이름
    
    
    
//    func setSubjects(subjectDic:[String:Int])
//    {
//        for (subName,subScore) in subjectDic
//        {
//            addSubject(name: subName, score: subScore)
//        }
//    }
    
    func power() -> Int
    {

        for subject in subjects
        {
            if subject.name == "싸움"
            {
                return subject.score
            }
        }
        return 0
    }
    
//    func mathScore() -> Int
//    {
//        for subject in subjects
//        {
//            if subject.name == "수학"
//            {
//                return subject.score
//            }
//        }
//        return 0
//    }
    
}
