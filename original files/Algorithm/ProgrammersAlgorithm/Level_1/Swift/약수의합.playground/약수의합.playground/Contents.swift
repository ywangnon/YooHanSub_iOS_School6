//: Playground - noun: a place where people can play

import UIKit

//어떤 수를 입력받아 그 수의 약수를 모두 더한 수 sumDivisor 함수를 완성해 보세요. 예를 들어 12가 입력된다면 12의 약수는 [1, 2, 3, 4, 6, 12]가 되고, 총 합은 28이 되므로 28을 반환해 주면 됩니다.

func sumDivisor(num: Int) -> Int {
    var answer: Int = 0;
    var divisorList: Array<Int> = Array<Int>()
    
    //약수 배열 생성
    for i in 1...num {
        if num%i == 0
        {
            divisorList.append(i)
        }
    }
    
    //생성된 약수 배열 인자의 총하
    for i in divisorList
    {
        answer += i
    }
    
    return answer;
}

// 아래는 테스트로 출력해 보기 위한 코드입니다.
print(sumDivisor(num: 28));
