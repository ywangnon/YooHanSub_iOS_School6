//: Playground - noun: a place where people can play

import UIKit

//Level 1
//시작과 끝수를 받아서 두 수 사이의 모든 수를 가지고 있는 배열 만들기
/// 두 수 사이의 수로 이루어진 배열 만들기
///
/// - Parameters:
///   - startNum: 배열이 시작되는 수
///   - endNum: 배열이 끝나는 수
/// - Returns: 입력된 수 사이의 수를 가지고 있는 배열
func gapArray(startNum: Int, endNum: Int) -> Array<Int>
{
    var seArray:Array<Int> = Array<Int>()
    
    for i in startNum...endNum
    {
        seArray.append(i)
    }

//    while문
//    var valueNum: Int = num1
//    while valueNum < num2 {
//
//        seArray.append(valueNum)
//        valueNum += 1
//    }
    
    return seArray
}

gapArray(startNum: 4, endNum: 8)

//정수 타입의 배열을 입력받아 모든 배열의 수의 합을 리턴하는 함수
func sumArray(list:Array<Int>) -> Int
{
    var _: Array<Int> = list
    var sum: Int = 0
    
    for i in list
    {
        sum += i
    }
    
    return sum
}

sumArray(list: [1,2,3,4,5,6])

//딕셔너리에 있는 모든 데이터 출력하는 함수 >> 데이터: ["name":"joo", "age":20, "job":"Developer"]
func reDic()
{
    let dic: [String:Any] = ["name":"joo", "age":20, "job":"Developer"]
    
    print(dic)
}

func printDic(_ dictionary:[String:Any])
{
    for (key, value) in dictionary
    {
        print(key,value, terminator: "/n")
    }
}

//reDic()
//print(printDic(["name":"joo", "age":20, "job":"Developer"]))

//Level 2
//정수 타입의 배열을 받아서 배열안의 중복된 수를 모두 제거된 배열을 반환하는 함수
func overlapArray(arr:Array<Int>) -> Array<Int>
{
    let transArray:Set<Int> = []
    let wArray:[Int] = arr

//    for i in arr
//    {
//        transArray.insert(arr[i])
//    }
    
//  Set 사용하지 않고
//    for n in list
//    {
//        if !resultList.contains(n)
//        {
//            resultList.append(n)
//        }
//    }
    
    return transArray.union(wArray).sorted()
}

overlapArray(arr: [1,2,3,2,3,4,5,6])

//정수 배열을 입력받아, 배열의 요소 중 두 개를 선택하는 조합을 모두 포함하는 배열을 작성하세요.
//>> [1, 2, 3] -> [[1, 2], [1, 3], [2, 3]]
/// 튜플로 만든 조합 배열
///
/// - Parameter arr: 조합할 배열
/// - Returns: 조합된 튜플을 값으로 가지는 배열
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

/// 배열을 값으로 가지는 배열
///
/// - Parameter list: 조합할 배열
/// - Returns: 조합된 배열을 값으로 가진 배열
func sperate(list:[Int]) -> [[Int]]//이중 배열
{
    var resultList:[[Int]] = []
    
    for n in 0..<list.count
    {
        let firstV = list[n]
        for i in n+1..<list.count
        {
            let secondV = list[i]
            resultList.append([firstV,secondV])
            
        }
    }
    
    return resultList
}

sperate(list: [1,2,3])
//Level 3

//정수 타입의 배열을 입력받아서 오름차순으로 정렬된 배열을 만들어 리턴하시오.(정렬 함수 사용x)   (정렬의 효율은 보지 않습니다.)
func sortArray(arr: [Int]) -> [Int]
{
    var sortedArray:[Int] = arr
    
    for originIndex in 0..<arr.count-1
    {
        var min = originIndex
        
        for compIndex in originIndex+1..<arr.count
        {
            if sortedArray[min]>sortedArray[compIndex]
            {
                min = compIndex
            }
        }
        if min != originIndex
        {
            let temp = sortedArray[min]
            sortedArray[min] = sortedArray[originIndex]
            sortedArray[originIndex] = temp
        }
    }
    
//    print(sortedArray)
    return sortedArray
}



//sortArray(arr: [7,8,6,5,3])
//>>에라토스테체 알고리즘을 이용하여  입력된 숫자까지의 모든 소수의 배열을 반환하는 함수

func eratosArray(num: Int)
{
    //var temp: Int
    var tempArray:[Int:Bool] = [:]
    var resultArray:[Int] = []
    
    for i in 2...num
    {
        tempArray.updateValue(true, forKey: i)
    }
    
    var i = 2
    
    while i*i<num
    {
        if tempArray[i] == true
        {
            for j in i*2...num
            {
                if j%i == 0
                {
                    tempArray.updateValue(false, forKey: j)
                }
            }
        }
        i += 1
    }
    
    for i in 2...num
    {
        if tempArray[i] == true
        {
            resultArray.append(i)
        }
    }
    
    print(resultArray)
    
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

eratosArray(num: 100)

