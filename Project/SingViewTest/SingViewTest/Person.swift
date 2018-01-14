//
//  Person.swift
//  SingViewTest
//
//  Created by Hansub Yoo on 2018. 1. 11..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import Foundation

class Person {
    //Int
    //Double
    //String
    var name: String = ""
    var age: Int = 0
    var height: Double = 0.0
    var weight: Double = 0.0
    var strength: Int = 10
    var dextarity: Int = 10
    var Vitality: Int = 10
    var Energy: Int = 10
    
    func plusStrength(click: Int) {
        strength = strength + click
    }
    
    func plusDex(click: Int) {
        dextarity += click
    }
    
    func plusVitality(click: Int) {
        Vitality += click
    }
    
    func plusEnergy(click: Int) {
        Energy += click
    }
    
    func concentaration(Streng: Int) -> Int {
        return Work(Streng*2)
    }
    
    func eat() {
        print("식사를 합니다.")
    }
    
    /// <#Description#>
    ///
    /// - Parameter time: <#time description#>
    /// - Returns: <#return value description#>
    func Work(_ time: Int) -> Int {
        print("\(time)동안 일을 하였습니다.")
        return 10000*time
    }
    
    /// 공부한 시간입니다.
    ///
    /// - Parameters:
    ///   - time: 공부한 시간입니다.
    ///   - bookpage: 공부한 책입니다.
    func study(time: Int, bookpage: Int) {
        print("\(time)동안 \(bookpage)쪽 공부를 하였습니다.")
    }
    
    func run(time: Int, distance: Int) -> Double {
        print("\(time)동안 \(distance)의 거리를 뛰었습니다.")
        return weight - ((Double)(time+distance)*3.0)
    }
    
}
