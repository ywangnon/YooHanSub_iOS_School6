
//: Playground - noun: a place where people can play

import UIKit

func scoreToGrade(score: Int) -> String
{
    var grade: String = "F"
    
    if 95 <= score && score <= 100 // 100 이하만 받는 조건문 안에 작성하여 밑으로는 일정 점수 이상만의 조건만 적을 수 있다.
    {
        grade = "A+"
    } else if 90 <= score && score <= 95
    {
        grade = "A"
    } else if 85 <= score && score <= 90
    {
        grade = "B+"
    } else if 80 <= score && score <= 85
    {
        grade = "B"
    } else if 75 <= score && score <= 80
    {
        grade = "C+"
    } else if 70 <= score && score <= 75
    {
        grade = "C"
    }
    
    return grade //grade 변수를 정해서 하나의 return만 쓰는 것이 보기 좋을 것 같다.
}


func gradeToPoint(Grade: String) -> Double
{
    //point 변수를 만들어서 return 하나만 사용하는 방식으로
    if Grade == "A+"
    {
        return 4.5
    } else if Grade == "A"
    {
        return 4.0
    } else if Grade == "B+"
    {
        return 3.5
    } else if Grade == "B"
    {
        return 3.0
    } else if Grade == "C+"
    {
        return 2.5
    } else if Grade == "C"
    {
        return 2.0
    } else
    {
        return 0.0
    }
}

scoreToGrade(score: 98)
gradeToPoint(Grade: scoreToGrade(score: 98))

//<if>
func evenCheck(num: Int) -> Bool
{
    var chk: Bool
    
    if num%2 == 0 {
        chk = true
    } else
    {
        chk = false
    }
    
    return chk
}

func stringCheck(str1: String, str2: String) -> Bool
{
    var chk: Bool
    
    if str1 == str2
    {
        chk = true
    } else
    {
        chk = false
    }
    
    return chk
}

func biggerCheck(num1: Double, num2: Double) -> Double
{
    var big: Double
    
    if num1 > num2
    {
        big = num1
    } else
    {
        big = num2
    }
    
    return big
    
}

func multipleThree(num: Int) -> Bool
{
    var chk: Bool
    
    if num%3 == 0
    {
        chk = true
    } else
    {
        chk = false
    }
    
    return chk
}

func divideNum(num1: Int, num2: Int) -> Double
{
    var share: Double
    
    if num2 == 0
    {
        share = 0
    } else
    {
        share = Double(num1) / Double(num2)
    }
    
    return share
}

//<응용>
// 응용 1번은 scoreToGrade

func gradeAverage(grade: String...) -> Double
{
    var aver: Double = 0
    var sum: Double = 0
    
    for grade in grade
    {
        if grade == "A+"
        {
            sum += 4.5
        } else if grade == "A"
        {
            sum += 4.0
        } else if grade == "B+"
        {
            sum += 3.5
        } else if grade == "B"
        {
            sum += 3.0
        } else if grade == "C+"
        {
            sum += 2.5
        } else if grade == "C"
        {
            sum += 2.0
        } else
        {
            sum += 0
        }
    }
    
    aver = sum / Double(grade.count)

    return aver
}

print(gradeAverage(grade: "A+", "B", "C", "D"))

func leapYear(year: Int) -> String
{
    var leap: String = "평년입니다."
    
    if year%100 == 0 && year%400 == 0
    {
        leap == "윤년입니다."
    } else if year%4 == 0 && year % 100 == 0
    {
        leap = "평년입니다."
    } else if year%4 == 0
    {
        leap = "윤년입니다."
    }
    
    return leap
}

print(leapYear(year: 23296))

func multipleCheck(num1: Int, num2: Int, num3: Int) -> Bool
{
    var chk: Bool
    
    if num1*num2*num3 > 0
    {
        chk = true
    } else
    {
        chk = false
    }
    
    return chk
}

print(multipleCheck(num1: -3, num2: -5, num3: 6))

func multipleCheckError(num1: Int, num2: Int, num3: Int) throws -> String
{
    var chk: String
    
    if num1*num2*num3 > 0
    {
        chk = "true"
    } else if num1*num2*num3 <= 0
    {
        chk = "false"
    } else
    {
        chk = "error"
    }
    
    return chk
}
