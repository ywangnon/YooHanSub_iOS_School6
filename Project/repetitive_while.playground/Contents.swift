//: Playground - noun: a place where people can play

import UIKit

/// 재귀함수
///
/// - Parameter num: 입력 숫자
/// - Returns: <#return value description#>
func test(num: Int) -> Int
{
    var sum = 0
    if num == 1 {
        return 1
    } else
    {
        sum = num + test(num: num-1)
        return sum
    }
}

test(num: 5)

/// timesTable Function
///
/// - Parameter times: Number of TimesTable you want to see
func timesTable(_ times: Int)
{
    var count: Int = 1
    
    while count < 10
    {
        print("\(times) x \(count) = \(times*count)")
        count += 1
    }
}

//timesTable(5)

/// 삼각수 구하기
/// ex) 3 -> 1+2+3
/// - Parameter num: 어디까지 구할 것인가
/// - Returns: 1부터 입력한 수까지 더한것
func triangular(num: Int) -> Int
{
    var start: Int = 1
    var sum: Int = 0
    
    while start <= num {
        sum += start
        start += 1
    }
    
    return sum
    
//    빼기로
//    var tempNum: Int = num
//    var resultNum = 0
//
//    while tempNum > 0 {
//        resultNum += tempNum
//        tempNum -= 1
//    }
//    return resultNum
    
}

triangular(num: 10)


/// 자리수 더하기
/// 쓰여진 수의 모든 자리수를 더한다.
/// ex) 123 -> 1+2+3
/// - Parameter num: 더할 수
/// - Returns: 입력한 수의 모든 자릿수를 더한 값
func addAll(num: Int) -> Int
{
    var sum: Int = 0
    var count: Int = num
    
    while count%10 > 0 {
//        let lastNum: Int = tempNum % 10
//        sum += lastNum | lastNum 변수를 바로 사용하고 반복되며 버리기 때문에 메모리상 낭비는 없다.
        sum += count%10
        count = count/10
    }
    
    return sum
}



/// 자릿수 바꾸기
/// ex) 123 -> 321
/// 캐스팅을 이용
/// - Parameter num: 뒤집을 수
/// - Returns: 뒤집힌 수
func revers(num: Int) -> String
{
    var reverNumber: String = ""
    var count: Int = num
    
    while count%10 > 0
    {
        reverNumber += String(count%10)
        count = count/10
    }
    
    return reverNumber
}

/// 자릿수 바꾸기
/// ex) 123 -> 321
/// 캐스팅을 이용하지 않음
/// - Parameter num: 뒤집을 수
/// - Returns: 뒤집힌 수
func revers2(num: Int) -> Int
{
    var revNumber: Int = 0
    var count: Int = num
    
    while count%10 > 0 {
        revNumber = revNumber * 10 + count % 10
        count = count/10
    }
    
    return revNumber
}

revers2(num: 123)
revers2(num: 34574376)

revers(num: 341)
revers(num: 37567826932)
