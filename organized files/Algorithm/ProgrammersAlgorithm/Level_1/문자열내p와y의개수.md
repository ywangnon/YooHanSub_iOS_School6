## 문제

//numPY함수는 대문자와 소문자가 섞여있는 문자열 s를 매개변수로 입력받습니다.   
//s에 'p'의 개수와 'y'의 개수를 비교해 같으면 True, 다르면 False를 리턴하도록 함수를 완성하세요. 'p', 'y' 모두 하나도 없는 경우는 항상 True를 리턴합니다.    
//예를들어 s가 pPoooyY면 True를 리턴하고 Pyy라면 False를 리턴합니다.

## Swift

```
func numPY(s: String) -> Bool {
    var result = false
    var pcount: Int = 0
    var ycount: Int = 0
    
    for ch in s
    {
        if ch == "y" || ch == "Y" {
            ycount += 1
        }
        if ch == "p" || ch == "P" {
            pcount += 1
        }
    }
    
    if pcount == ycount
    {
        result = true
    }else
    {
        result = false
    }
    
    return result;
}


// 아래는 테스트로 출력해 보기 위한 코드입니다.
print( numPY(s: "pPoooyY") )
print( numPY(s: "Pyy") )
```

## 결과
true<br>
false

## 특이사항
- 문자열 한글자씩 추출은 그냥 문자열을 for-in문에 넣으면 된다.
