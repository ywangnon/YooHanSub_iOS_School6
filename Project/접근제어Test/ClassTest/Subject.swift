//
//  Subject.swift
//  ClassTest
//
//  Created by youngmin joo on 2018. 1. 22..
//  Copyright © 2018년 youngmin joo. All rights reserved.
//

import Foundation


struct Subject {
    
    var name:String
    var score:Int
    
    var isHasGrade:Bool
    
    var point:Double?
    var grade:String?{
        
        if isHasGrade
        {
            if score <= 100 && score >= 95
            {
                return "A+"
            }else
            {
                return "F"
            }
        }else
        {
            return nil
        }
    }
    
    init(name:String, score:Int, isHasGrade:Bool) {
        self.name = name
        self.score = score
        self.isHasGrade = isHasGrade
        
    }
}

