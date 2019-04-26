//: Playground - noun: a place where people can play

import UIKit

//nextSqaure함수는 정수 n을 매개변수로 입력받습니다.
//n이 임의의 정수 x의 제곱이라면 x+1의 제곱을 리턴하고, n이 임의의 정수 x의 제곱이 아니라면 'no'을 리턴하는 함수를 완성하세요.
//예를들어 n이 121이라면 이는 정수 11의 제곱이므로 (11+1)의 제곱인 144를 리턴하고, 3이라면 'no'을 리턴하면 됩니다.

/// 제곱근판별하기
///
/// - Parameter num: 입력받는 정수
/// - Returns: 제곱값인지 확인 후 그에 따른 결과값
func nextSqaure(num: Int) -> Any {
    var result: Any = "no";
    //함수를 완성하세요
    
    for i in 0..<num
    {
        if i*i == num {
            result = (i+1) * (i+1)
        }
    }
    
    return result;
}

nextSqaure(num: 1212)
nextSqaure(num: 121)


