//
//  Humanoid.swift
//  Class&StructPractic
//
//  Created by Hansub Yoo on 2018. 1. 25..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import Foundation

class Humanoid: Robot {
    var weapon: [String:Int] = [:]
    var brand: String?
    
    var isPossibleChange: Bool = false
    var changeForm: String?
    
    init(name: String, makeDay: String, fuel: String) {
        super.init(name: name, makeDay: makeDay)
        
        if let energy = Int(fuel)
        {
            super.fuel = energy
        }
    }
    
    convenience init(name: String, makeDay: String, fuel: String, brand: String?) {
        self.init(name: name, makeDay: makeDay, fuel: fuel)
        
        if let compny: String = brand
        {
            self.brand = compny
            isPossibleChangeForm(brand: compny)
        }
    }
    
    func isPossibleChangeForm(brand: String) {
        guard brand == "Apple" else {
            return
        }
        isPossibleChange = true
    }
    
    func setForm(form: String) {
        if isPossibleChange
        {
            if changeForm == nil
            {
                self.changeForm = form
            }
        }
    }
    
    func addWeapon(weapon: String, damage: Int) {
        self.weapon.updateValue(damage, forKey: weapon)
    }
    
    func setWeapon(weaponList: [String:Int]) {
        for arms in weaponList
        {
                self.addWeapon(weapon: arms.key, damage: arms.value)
        }
    }
}
