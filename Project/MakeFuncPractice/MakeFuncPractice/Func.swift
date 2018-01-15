//
//  FigureFunc.swift
//  MakeFuncPractice
//
//  Created by Hansub Yoo on 2018. 1. 15..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import Foundation

class FigureFunc {
    
    func squreArea(length: Int) -> Int {
        return length * length
    }
    
    func squrePerimeter(length: Int) -> Int {
        return  length*4
    }
    
    func rectangleArea(length: Int, width: Int) -> Int {
        return length * width
    }
    
    func rectanglePerimeter(length: Int, width: Int) -> Int {
        return (2 * length) + (2 * width)
    }
    
    func circleArea(radius: Int) -> Double {
        return Double.pi * Double(radius * radius)
    }
    
    func circlePerimeter(radius: Int) -> Double {
        return 2 * Double.pi * Double(radius)
    }
    
    func triArea(bottom: Int, height: Int) -> Double {
        return Double(bottom * height) * 0.5
    }
    
    func trapezoidArea(bottom: Int, top: Int, height: Int) -> Double {
        return 0.5 * Double(height) * Double((bottom + top))
    }
    
    func cubeVolume(length: Int) -> Int {
        return length * length * length
    }
    
    func recsolidVolume(length: Int, width: Int, height: Int) -> Int {
        return width * length * height
    }
    
    func circularcylinderVolume(radius: Int, height: Int) -> Double {
        return Double.pi * Double(radius) * Double(height)
    }
    
}
