## 문제

//별이는 헬로월드텔레콤에서 고지서를 보내는 일을 하고 있습니다. 개인정보 보호를 위해 고객들의 전화번호는 맨 뒷자리 4자리를 제외한 나머지를 "*"으로 바꿔야 합니다.   
//전화번호를 문자열 s로 입력받는 hide_numbers함수를 완성해 별이를 도와주세요.   
//예를들어 s가 "01033334444"면 "*******4444"를 리턴하고, "027778888"인 경우는 "*****8888"을 리턴하면 됩니다.   


## Swift

```
func hide_numbers(s: String) -> String {
    var result: String = ""
    //함수를 완성해주세요
    
    let startIndex: String.Index = s.index(s.endIndex , offsetBy: -4)
    let endIndex: String.Index = s.endIndex
    let range = startIndex..<endIndex
    
    for _ in 0..<s.count-4
    {
        result += "*"
    }
    
    result += s[range]
    
    return result;
}

// 아래는 테스트로 출력해 보기 위한 코드입니다.
print("결과 : " + hide_numbers(s: "01033334444"));
print("결과 : " + hide_numbers(s: "027778888"));
```

## 결과

결과 : *******4444<br>
결과 : *****8888
