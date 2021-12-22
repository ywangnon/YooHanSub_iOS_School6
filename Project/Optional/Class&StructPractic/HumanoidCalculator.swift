//
//  HumanoidCalculator.swift
//  Class&StructPractic
//
//  Created by Hansub Yoo on 2018. 1. 25..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import Foundation

//평균 공격력
func averDamage(robot: Humanoid) -> Int
{
    var sum: Int = 0
    var aver: Int = 0
    
    for arms in robot.weapon
    {
        sum += arms.value
    }
    
    aver = sum/robot.weapon.count
    
    print("\(robot.name)의 평균 공격력: \(aver)입니다.")
//    return "\(robot.name)의 평균 공격력: \(aver)입니다."
    return aver
}

func maxDamageWeapon(robot: Humanoid) -> [String:Int]
{
    var max = 0
    var weaponName: String = ""
    
    for arms in robot.weapon
    {
        if arms.value > max
        {
            max = arms.value
            weaponName = arms.key
        }
    }
    
    return [weaponName:max]
}

func maxDamage(robots: Humanoid...) -> Humanoid
{
    var max: Int = 0
    var name: String = ""
    var robot: Humanoid!
    
    for humanoid in robots
    {
        for arms in humanoid.weapon
        {
            if arms.value > max
            {
                max = arms.value
                name = humanoid.name
                robot = humanoid
            }
        }
    }
    
    print("\(name)의 공격력이 \(max)로 가장 높습니다.")
    
//    return "\(name)의 공격력이 \(max)로 가장 높습니다."
    return robot
}

func compDamage(robot1: Humanoid, robot2: Humanoid) -> Humanoid?
{
    guard robot1.brand == "Apple" && robot2.brand == "Apple" else
    {
        return nil
    }
    
    return averDamage(robot: robot1) > averDamage(robot: robot2) ? robot1 : robot2
}


