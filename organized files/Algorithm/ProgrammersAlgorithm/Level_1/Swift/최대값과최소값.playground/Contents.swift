//getMinMaxString 메소드는 String형 변수 str을 매개변수로 입력받습니다.
//str에는 공백으로 구분된 숫자들이 저장되어 있습니다.
//str에 나타나는 숫자 중 최소값과 최대값을 찾아 이를 (최소값) (최대값)형태의 String을 반환하는 메소드를 완성하세요.
//예를들어 str이 1 2 3 4라면 1 4를 리턴하고, -1 -2 -3 -4라면 -4 -1을 리턴하면 됩니다.

func getMinMaxString(str: String) -> String
{
    var strList: Array<Substring> = str.split(separator: " ")
    var intList: [Int] = []
    var resultStr:String = ""
    var maxIndex: Int = 0
    var minIndex: Int = 0
    
    for intStr in strList {
        intList.append(Int(intStr)!)
    }
    
    for index in 0..<intList.count
    {
        if intList[index] > intList[maxIndex] {
            maxIndex = index
        }
    }
    
    for index in 0..<intList.count
    {
        if intList[index] < intList[minIndex] {
            minIndex = index
        }
    }
    
    resultStr = strList[minIndex] + " " + strList[maxIndex]
    
    return resultStr
}

print(getMinMaxString(str: "1 2 3 4"))
print(getMinMaxString(str: "-5 -7 -2 -1"))
