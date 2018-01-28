//strange_sort함수는 strings와 n이라는 매개변수를 받아들입니다.
//strings는 문자열로 구성된 리스트인데, 각 문자열을 인덱스 n인 글자를 기준으로 정렬하면 됩니다.
//
//예를들어 strings가 [sun, bed, car]이고 n이 1이면 각 단어의 인덱스 1인 문자 u, e ,a를 기준으로 정렬해야 하므로 결과는 [car, bed, sun]이 됩니다.
//strange_sort함수를 완성해 보세요.
//

func strange_sort(strings: [String], n: Int) -> [String] {
    var standardList: [Character] = []
    var strList: Array<String> = strings
    
    //입력한 위치의 캐릭터 추출
    for str in strList {
        var strTemp: String = str
        for _ in 0..<n {
            strTemp.removeFirst()
        }
        standardList.append(strTemp.removeFirst())
    }
    
    var min: Int
    
    //문자간 크기를 비교하고 작은 인덱스 순서대로 배열
    for n in 0..<standardList.count-1
    {
        min = n
        for comp in n+1..<standardList.count {
            if standardList[comp] < standardList[min]
            {
                min = comp
            }
        }
        if min != n {
            var temp: Character
            temp = standardList[n]
            standardList[n] = standardList[min]
            standardList[min] = temp
            
            var strTemp: String
            strTemp = strList[n]
            strList[n] = strList[min]
            strList[min] = strTemp
        }
    }
    
    return strList
}

print(strange_sort(strings: ["sun", "bed", "car"], n: 0))
print(strange_sort(strings: ["sun", "bed", "car"], n: 1))
print(strange_sort(strings: ["sun", "bed", "car"], n: 2))


