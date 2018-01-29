//: Playground - noun: a place where people can play

import UIKit

//피보나치 수는 F(0) = 0, F(1) = 1일 때, 2 이상의 n에 대하여 F(n) = F(n-1) + F(n-2) 가 적용되는 점화식입니다. 2 이상의 n이 입력되었을 때, fibonacci 함수를 제작하여 n번째 피보나치 수를 반환해 주세요. 예를 들어 n = 3이라면 2를 반환해주면 됩니다.

func fibonacci(num: Int) -> Int {
    var answer: Int = 0;
    
    if num == 0 || num == 1 {
        answer = num
    } else {
       answer = fibonacci(num: num-1) + fibonacci(num: num-2)
    }
    
    return answer;
}

// 아래는 테스트로 출력해 보기 위한 코드입니다.
print(fibonacci(num: 8))
