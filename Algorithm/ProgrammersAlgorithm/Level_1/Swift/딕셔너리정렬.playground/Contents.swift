//딕셔너리는 들어있는 값에 순서가 없지만, 키를 기준으로 정렬하고 싶습니다. 그래서 키와 값을 튜플로 구성하고, 이를 순서대로 리스트에 넣으려고 합니다.
//예를들어 {김철수:78, 이하나:97, 정진원:88}이 있다면 각각의 키와 값을
//
//(김철수, 78)
//(이하나, 97)
//(정진원, 88)
//과 같이 튜플로 분리하고 키를 기준으로 정렬해서 다음과 같은 리스트를 만들면 됩니다.
//[ (김철수, 78), (이하나, 97), (정진원, 88) ]
//
//다음 sort_dictionary 함수를 완성해 보세요.


func sort_dictionary(dicList: [String:Int]) -> [(String,Int)]
{
    var dicTemp = dicList
    var result: [(String, Int)] = []
    var strList: [String] = []
    
    //키값만 갖는 배열 생성
    for dic in dicList {
        strList.append(dic.key)
    }
    
    //strList의 최소값과 일치하면 result 배열에 추가, 추가한 최소값은 strList에서 제거
    for _ in 0..<dicList.count {
        for dic in dicTemp {
            //단어들의 최소값순으로 정렬
            if strList.min() == dic.key
            {
                let tu:(String, Int) = (dic.key, dic.value)
                result.append(tu)
            }
        }
        //컴퓨터 입장에서 최소값이 없을 수 있고, 고로 인덱스가 없을 수 있다고 판단하여 옵셔널 넣음
        //개인적으로 옵셔널이 별로라 생각하지만 이외에는 아직 생각이 나지 않음
        strList.remove(at: strList.index(of: strList.min()!)!)
    }
    
    return result
}

print(sort_dictionary(dicList: ["김철수":78, "이하나":97, "정진원":88]))
