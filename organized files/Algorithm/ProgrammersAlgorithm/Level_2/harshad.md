## 문제

//양의 정수 x가 하샤드 수이려면 x의 자릿수의 합으로 x가 나누어져야 합니다. 예를들어 18의 자릿수 합은 1+8=9이고, 18은 9로 나누어 떨어지므로 18은 하샤드 수입니다.<br>
//Harshad함수는 양의 정수 n을 매개변수로 입력받습니다. 이 n이 하샤드수인지 아닌지 판단하는 함수를 완성하세요.
//예를들어 n이 10, 12, 18이면 True를 리턴 11, 13이면 False를 리턴하면 됩니다.<br>

## Swift

```
func Harshad(num: UInt) -> Bool {
    var result: Bool = false
    var sum: UInt = 0
    var harshad: UInt = 0
    var number: UInt = num
    
    while number > 0 {
        sum += number % 10
        number = number / 10
    }
    
    harshad = num % sum
    
    if harshad == 0 {
        result = true
    }else
    {
        result = false
    }
    
    return result
}

// 아래는 테스트로 출력해 보기 위한 코드입니다.
print(Harshad(num: 10))
print(Harshad(num: 11))
print(Harshad(num: 12))
print(Harshad(num: 13))
print(Harshad(num: 18))
```

## 결과

true<br>
false<br>
true<br>
false<br>
true<br>
