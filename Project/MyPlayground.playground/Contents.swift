//: Playground - noun: a place where people can play
//Playground는 위에서부터 읽어 내려옴
import UIKit

var str = "Hello, playground"

print(str + " 시작이야")

let sampleText = "<<<Hello>>>"
let startIndex = sampleText.index(sampleText.startIndex, offsetBy: 3)
let endIndex = sampleText.index(sampleText.endIndex, offsetBy: -4)//인덱스 플래그가 >>>뒤에 있음. "<<<Hello>>>P", 내가 잘못이해하고 있는지도...

let substring1: Substring = sampleText[startIndex...endIndex]
//뒤부터 시작한다고 생각해볼수도 있다. startIndex 3개 뒤 H부터 endIndex 4개 앞의 o뒤까지
let resultStr:String = String(substring1) // “Hello”
print(resultStr)

var sampleTuple: (Int, String, Int) = (3, "yoo", 4)
print(sampleTuple.0)
print(sampleTuple.1)
print(sampleTuple.2)

func calculator(num1: Int, num2:Int) -> (Int, String)
{
    let sum: Int = num1 + num2
    return (sum, String(sum))
}

let result: (intSum: Int, strSum: String) = calculator(num1: 10, num2: 3)
let intResult: Int = result.intSum
let stringResult: String = result.strSum

var stringNum: String
var doubleNum: Double
let intNum: Int = 3

stringNum = String(intNum)
doubleNum = Double(intNum)

let num: String = "3"
let str1 = Int(num)
//String을 Int로 바꿀때 실패할 수 있고 이때 nil값이 들어갈 수 있다.

func inchTocm(inch: Double) -> Double {
    return inch * 2.54
}

func cmToinch(cm: Double) -> Double {
    return cm * 0.393701
    
}

func m2ToPyung(m2: Double) -> Double {
    return m2 * 0.3025
}

func pyungTom2(pyung: Double) -> Double {
    return pyung * 3.30579
}

func cTof(c: Double) -> Double {
    return c * 1.8 + 32
}

func fToc(f: Double) -> Double {
    return (f - 32.0) / 1.8
}

func kbTomb(kb: Double) -> Double {
    return kb / 1024
}

func mbTogb(mb: Double) -> Double {
    return mb / 1024
}

func timeTosecond(time: Int) -> Int {
    return (time/10000)*3600 + ((time%10000)/100)*60 + time%100
}

func secondToHour(second: Int) -> Int {
    return second%60 + ((second/60)%60)*100 + ((second/60)/60)*10000
}

print(timeTosecond(time: 11320))
print(secondToHour(second: 4400))


