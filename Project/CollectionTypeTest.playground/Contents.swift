//: Playground - noun: a place where people can play

import UIKit

//Level 1
func intArray(num1: Int, num2: Int) -> Array<Int>
{
    var seArray:Array<Int> = Array<Int>()
    
    for i in num1...num2
    {
        seArray.append(i)
    }
    
    return seArray
}

intArray(num1: 4, num2: 9)

func sumArray(arr:Array<Int>) -> Int
{
    var _: Array<Int> = arr
    var sum: Int = 0
    
    for i in arr
    {
        sum += i
    }
    
    return sum
}

sumArray(arr: [1,2,3,4,5,6])

func reDic()
{
    let dic: [String:Any] = ["name":"joo", "age":20, "job":"Developer"]
    
    print(dic)
}

//reDic()

//Level 2
func overlapArray(arr:Array<Int>) -> Array<Int>
{
    var transArray:Set<Int> = []
    var wArray:[Int] = arr

//    for i in arr
//    {
//        transArray.insert(arr[i])
//    }
    
    return transArray.union(wArray).sorted()
}

overlapArray(arr: [1,2,3,2,3,4,5,6])

func combineArray(arr:[Int]) -> [(Int,Int)]
{
    var wArray:[Int] = arr
    var mixArray:[(Int,Int)] = []
    
    
    for i in 1...arr.count-1
    {
        for j in i+1...arr.count
        {
            mixArray.append((wArray[i-1],wArray[j-1]))
        }
    }
    
    return mixArray
}

combineArray(arr: [1,2,3])

//Level 3
func sortArray(arr: [Int])
{
    var wArray:[Int] = arr
    
    arr.count
    
    for i in 0...arr.count-2
    {
        var min = i
        
        for j in i+1...arr.count-1
        {
            if wArray[min]>wArray[j]
            {
                min = j
            }
        }
        if min != i
        {
            let temp = wArray[min]
            wArray[min] = wArray[i]
            wArray[i] = temp
        }
    }
    
    print(wArray)
}

//sortArray(arr: [7,8,6,5,3])

func eraArray(num: Int)
{
    //var temp: Int
    var resultArray:[Int:Bool] = [:]
    var tempArray:[Int] = []
    
    for i in 2...num
    {
        resultArray.updateValue(true, forKey: i)
    }
    
    var i = 2
    
    while i*i<num
    {
        if resultArray[i] == true
        {
            for j in i*2...num
            {
                if j%i == 0
                {
                    resultArray.updateValue(false, forKey: j)
                }
            }
        }
        i += 1
    }
    
    for i in 2...num
    {
        if resultArray[i] == true
        {
            tempArray.append(i)
            tempArray.rem
        }
    }
    
    print(tempArray)
    
//    for i in 2...num
//    {
//        resultArray.append(i)
//    }
//
//    temp = resultArray[0]
//
//    while temp*temp < num {
//        for i in resultArray {
//            if resultArray[i]%temp == 0 {
//                tempArray.append(resultArray[i])
//            }
//        }
//
//        temp = resultArray[0]
//    }
//    print(resultArray)
}

eraArray(num: 100)


