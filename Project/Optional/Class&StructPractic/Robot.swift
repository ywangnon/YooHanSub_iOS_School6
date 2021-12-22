//
//  Robot.swift
//  Class&StructPractic
//
//  Created by Hansub Yoo on 2018. 1. 25..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import Foundation

class Robot {
    var name: String
    var makeDay: String
    var fuel: Int?
    
    init(name: String, makeDay: String) {
        self.name = name
        self.makeDay = makeDay
    }
    
    convenience init(name: String, makeDay: String, fuel: Int)
    {
        self.init(name: name, makeDay: makeDay)
        self.fuel = fuel
    }
}
