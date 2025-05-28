//: Playground - noun: a place where people can play

import UIKit

/// for을 이용한 구구단
///
/// - Parameter num: 단수
func timesTable_for(num: Int)
{
    for i in 1...9
    {
        print("\(num) * \(i) = \(num*i)")
    }
}

//timesTable_for(num: 4)

/// 팩토리알 구하기
///
/// - Parameter num: 팩토리얼할 수
/// - Returns: 팩토리얼 값
func factorial(_ num: Int) -> Int
{
    var mul: Int = 1
    var strFacto: String = ""
    
    for i in 1...num {
        mul *= i
    }
    
    for i in 1...num {
        strFacto += String(num-i+1)
        strFacto += " * "
    }
    
    print("\(num)! = \(strFacto.dropLast().dropLast())")
    
    return mul
}

//factorial(5)

func collatz(num: Int) -> Int
{
    var count: Int = 0
    var colNum: Int = num
    
    while colNum != 1 {
        if count>500 {
            return -1
        } else if colNum%2 == 0
        {
            colNum /= 2
        } else
        {
            colNum *= 3
            colNum += 1
        }
        count += 1
    }
    
//    if count>500 {
//        count = -1
//    }
    
    return count
}

collatz(num: 5)

func harshad(num: Int) -> Bool
{
    var sum: Int = 0
    var tempNum: Int = num
    
    for _ in 1...String(num).count {
        sum += tempNum%10
        tempNum /= 10
    }
    
    if num%sum == 0
    {
        return true
    } else
    {
        return false
    }
}

func harshad2(num: Int) -> Bool
{
    var sum: Int = 0
    var tempNum: Int = num
    
    while tempNum != 0 {
        sum += tempNum%10
        tempNum /= 10
    }
    
    if num%sum == 0
    {
        return true
    } else
    {
        return false
    }
}

harshad(num: 18)
harshad2(num: 18)

func q1(num: Int, num2: Int) -> Int
{
    var result: Int = 1
    for _ in 1...num2
    {
        result *= num
    }
    return result
}

//q1(num: 2, num2: 3)

func q2(num: Int)
{
    for i in 1...num
    {
        if i%2==0
        {
            print(i)
        }
    }
}

//q2(num: 8)

func q3(num: Int, num2: Int)
{
    for i in 1...100
    {
        if i%num == 0 && i%num2 == 0
        {
            print(i)
        }
    }
}

//q3(num: 3, num2: 5)

func q4(num: Int)
{
    for i in 1...num
    {
        if num%i == 0
        {
            print(i)
        }
    }
}

func q5(num: Int) -> Bool
{
    if num != 1 {
        for i in 2..<num {
            if num%i == 0 {
                return false
            }
        }
    return true
    }
    return false
}

q5(num: 1)
q5(num: 5)

func q6(num: Int) -> Int
{
    var num1: Int = 0
    var num2: Int = 1
    
    for _ in 1...num
    {
        let temp = num1 + num2
        num1 = num2
        num2 = temp
    }
    
    return num1
}
//재귀함수로

func q6_2(num: Int) -> Int
{
    if(num == 0 || num == 1)
    {
        return num
    } else
    {
        return q6_2(num: num-1) + q6_2(num: num-2)
    }
}

q6(num: 1)

q6_2(num: 3)
