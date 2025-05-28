//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var array:Array< Int > = [1,2,3,4]

array.count

array.isEmpty

array.append(5)

array.insert(6, at: 2)

array.remove(at: 4)

func arrayTest()
{
    var list:[String] = ["my", "name", "is", "a", "yoo", "hansub"]
    list.append("입니다.")
    print("list 배열의 총 갯수는 ", list.count)
    print(list[3])
    list.remove(at: 3)
    list.insert("my introduce it my self.", at: 0)
    
    for text in list
    {
        print(text)
    }
}

//arrayTest()

import Foundation

var a = readLine()

if let  a = a {
    var array = a.components(separatedBy: " ")
    let sol = Int(array[0])! + Int(array[1])!
    print(sol)
}

func setTest()
{
    let digits1: Set = [1,2,3,7,8,9]
    let digits2: Set = [3,4,8,9,10]
    let digits3: Set = [1,2,3,4,5]

    print("test====")
    
    
    let intersectList = digits1.intersection(digits2)
    print(intersectList)
    
    let differenceList = digits1.symmetricDifference(digits3)
    print(differenceList)
    
    let unionList = digits1.union(digits2).sorted()
    print(unionList)
    
    let subtractList = digits1.subtracting(digits3).sorted()
    print(subtractList)
}

//setTest()

func dicTest()
{
    var dic:[String:Any] = ["name":"joo", "age":23, "job":"Developer", "isSingle":true]
    
    dic.updateValue("Seoul", forKey: "address")
    
    dic.updateValue("winman", forKey: "name")
    
    dic.removeValue(forKey: "isSingle")
    
    let introduce: String = "제 이름은" + (dic["name"] as! String) + "입니다."
    
    let doubleAge = (dic["age"] as! Int) * 2
    
    print(dic)
    
    for (key, value) in dic
    {
        print("key값: \(key), value: \(value)")
    }
}

dicTest()

