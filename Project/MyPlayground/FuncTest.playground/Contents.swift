//: Playground - noun: a place where people can play

//<기초>
import UIKit

func printName(name: String)
{
    print("\(name)")
}

func printAge(age: Int)
{
    print("\(age)")
}

func printIntro(name: String, age: Int)
{
    print("안녕하세요. 제 이름은 \(name)입니다.\n 나이는 \(age)입니다.")
}

print(printIntro(name: "유한섭", age: 31 ))

func divideNumTwo(num: Int) -> Double
{
    return Double(num)/2 //Double(2)
}

func squre(of num: Int) -> Int
{
    return num * num
}

//<응용 - 다중 입력, 반환>
func sum(num1: Int, num2: Int) -> Int
{
    return num1 + num2
}

func sub(num1: Int, num2: Int) -> Int
{
    return num1 - num2
}

func mul(num1: Int,num2: Int) -> Int
{
    return num1 * num2
}

func divide(num1: Int, num2: Int) -> Double
{
    if num2 == 0
    {
        return 0
    } else
    {
        return Double(num1)/Double(num2)
    }
}

//<응용>
func subAge(momAge: Int, sonAge: Int)
{
    print("어머니의 나이는 \(momAge)이고 내 나이는 \(sonAge)이므로 우리의 나이차이는 \(momAge-sonAge)입니다.")
}

print(subAge(momAge: 40, sonAge: 20))

func testAver(sub: Int...) -> Double
{
    var total: Int = 0
    
    for sub in sub
    {
        total += sub
    }
    
    return Double(total)/Double(sub.count)
}

print(testAver(sub: 90,80,70,60,50))

//<캐스팅>
func changeDouble(num: Int) -> Double
{
    return Double(num)
}

func unionNum(num1: Int, num2: Int) -> String
{
    return String(num1) + String(num2)
}

print(unionNum(num1: 3, num2: 4))

func roundNum(num: Double) -> Int
{
    
//    return Int(round(num))
//    let ronum = num*10
//
//    if(Int(ronum)%10>5)
//    {
//        return Int((ronum+10)/10)
//    } else
//    {
//        return Int(ronum/10)
//    }
    return Int(num+0.5)
}

//가장 마지막 자리에서 반올림하기


roundNum(num: 10.9)
