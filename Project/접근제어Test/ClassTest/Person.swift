//
//  Person.swift
//  ClassTest
//
//  Created by youngmin joo on 2018. 1. 22..
//  Copyright © 2018년 youngmin joo. All rights reserved.
//

import Foundation


class Person
{
    var name:String
    var gender:String
    var blood:String?
    
    
    init(name:String, gender:String) {
        self.name = name
        self.gender = gender
    }
    
    convenience init(name:String, gender:String, blood:String) {
        self.init(name:name, gender:gender)
        self.blood = blood
        
    }
    

}






