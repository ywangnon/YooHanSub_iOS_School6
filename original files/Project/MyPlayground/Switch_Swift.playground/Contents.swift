//: Playground - noun: a place where people can play

import UIKit

func scoreToGrade(score: Int) -> String
{
    var grade: String = "F"
    
    switch score {
    case 95...100:
        grade = "A+"
    case 90..<95:
        grade = "A"
    case 85..<90:
        grade = "B+"
    case 80..<85:
        grade = "B"
    case 75..<80:
        grade = "C+"
    default:
        grade = "F"
    }
    
    return grade
}

func gradeToPoint(grade: String) -> Double
{
    var point: Double = 0
    
    switch grade {
    case "A+":
        point = 4.5
    case "A":
        point = 4.0
    case "B+":
        point = 3.5
    case "B":
        point = 3.0
    case "C+":
        point = 2.5
    default:
        point = 0
    }
    
    return point
}

print(scoreToGrade(score: 98))
print(gradeToPoint(grade: scoreToGrade(score: 98)))

func area(width: Double, height: Double, radian: Double) -> Double
{
    let compareData: (Double, Double, Double) = (width, height, radian)
    var area: Double = 0
    
    switch compareData {
    case (let x, 0, 0):
        area = x*x
    case (let x, let y, 0):
        area = x*y
    case (0, 0, let r):
        area = Double.pi*r*r
    default:
        area = 0
    }
    
    return area
}

print(area(width: 7, height: 0, radian: 0))
print(area(width: 8, height: 7, radian: 0))
print(area(width: 0, height: 0, radian: 8))

func figureArea(height: Double, horizontal: Double = 0, vertical: Double = 0, radian: Double = 0) -> Double
{
    var volume: Double = 0
    let tupleValue = (height, horizontal, vertical, radian)

    switch tupleValue {
    case (let h, 0, 0, 0):
        volume = h*h*h
    case (let h, let ho, let ver, 0):
        volume = h*ho*ver
    case (let h, 0, 0, let rad):
        volume = Double.pi * h * rad * rad
    default:
        volume = 0
    }

    return volume
}

