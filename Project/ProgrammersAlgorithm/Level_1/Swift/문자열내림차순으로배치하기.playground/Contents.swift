//reverseStr 메소드는 String형 변수 str을 매개변수로 입력받습니다.
//str에 나타나는 문자를 큰것부터 작은 순으로 정렬해 새로운 String을 리턴해주세요.
//str는 영문 대소문자로만 구성되어 있으며, 대문자는 소문자보다 작은 것으로 간주합니다.
//예를들어 str이 Zbcdefg면 gfedcbZ을 리턴하면 됩니다.

func reverseStr(str: String) -> String
{
    var strTemp: String = str
    var resultStr: String = ""
    var max: Character
    
    for num in 0..<str.count
    {
        resultStr += String(strTemp.max()!)
        let index: String.Index = strTemp.index(of: strTemp.max()!)!
        strTemp.remove(at: index)
    }

//    let m = strTemp.index(strTemp.startIndex, offsetBy: 5)
//    strTemp.remove(at: m)
    
//    for num1 in 0..<strTemp.count-1
//    {
//        max = num1
//        for num2 in num1+1..<strTemp.count {
//            if strTemp[strTemp.index(str.startIndex, offsetBy: num2)] > strTemp[strTemp.index(str.startIndex, offsetBy: max)] && !(resultStr.contains(strTemp[strTemp.index(str.startIndex, offsetBy: max)])){
//                max = num2
//            }
//        }
//        resultStr += String(strTemp[strTemp.index(str.startIndex, offsetBy: max)])
//        strTemp.remove(at: strTemp.index(str.startIndex, offsetBy: max))
//    }

//    for ch1 in strTemp
//    {
//        max = ch1
//        for ch2 in strTemp
//        {
//            if ch2 > max && !(resultStr.contains(ch2))
//            {
//                max = ch2
//            }
//        }
//        max
//        resultStr += String(max)
//    }
//    resultStr.contains("h")
    return resultStr
}

print(reverseStr(str: "Zbcdefg"))


