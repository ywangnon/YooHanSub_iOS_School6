## 문제

//reverseStr 메소드는 String형 변수 str을 매개변수로 입력받습니다.     
//str에 나타나는 문자를 큰것부터 작은 순으로 정렬해 새로운 String을 리턴해주세요.       
//str는 영문 대소문자로만 구성되어 있으며, 대문자는 소문자보다 작은 것으로 간주합니다.     
//예를들어 str이 Zbcdefg면 gfedcbZ을 리턴하면 됩니다.   

## Swift

```
func reverseStr(str: String) -> String
{
    var strTemp: String = str
    var resultStr: String = ""
    
    for _ in 0..<str.count
    {
        resultStr += String(strTemp.max()!)
        let index: String.Index = strTemp.index(of: strTemp.max()!)!
        strTemp.remove(at: index)
    }

    return resultStr
}

print(reverseStr(str: "Zbcdefg"))
```

## 결과

gfedcbZ

## 특이사항

옵셔널을 지나치게 사용한 것 같다.
나중에 수정해보자