## 문제
//두 수를 입력받아 두 수의 최대공약수와 최소공배수를 반환해주는 gcdlcm 함수를 완성해 보세요. 배열의 맨 앞에 최대공약수, 그 다음 최소공배수를 넣어 반환하면 됩니다.   
//예를 들어 gcdlcm(3,12) 가 입력되면, [3, 12]를 반환해주면 됩니다.

## Swift
```
func gcdlcm(num1: Int, num2: Int) -> [Int]{
    var answer: Array<Int> = []
    var maxFactor: Int
    var minFactor: Int
    
    let big: Int
    let small: Int
    
    //입력받은 수 크기 비교
    if num1 > num2
    {
        big = num1
        small = num2
    }else
    {
        big = num2
        small = num1
    }
    
    //최대공약수, 최소공배수 인자
    maxFactor = 1
    minFactor = big
    
    //최소공배수 구하기
    for num in 1...small
    {
        if num1%num == 0 && num2%num == 0
        {
            maxFactor = num
        }
    }
    
//    while minFactor > 0 {
//        if minFactor%num1 == 0 && minFactor%num2 == 0 {
//            break
//        }
//        minFactor += 1
//    }

    while !(minFactor%num1 == 0 && minFactor%num2 == 0) {
        minFactor += 1
    }

    
    answer = [maxFactor, minFactor]
    
    return answer;
}

// 아래는 테스트로 출력해 보기 위한 코드입니다.
print(gcdlcm(num1: 5, num2: 13));
```

## 결과
//[1, 65]
