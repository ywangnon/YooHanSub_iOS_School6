//: Playground - noun: a place where people can play

import UIKit

func inNumber(inputNum: String, inputNum2: String) -> Bool
{
    if let x:Int = Int(inputNum) && let y:Int = Int(inputNum2)
    {
        return true
    }else
    {
        return false
    }
}
