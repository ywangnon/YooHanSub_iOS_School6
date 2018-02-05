
func  dominantIndex(_ nums: [Int]) -> Int {
    //결과값: 최대값의 인덱스
    var result: Int = 0
    //원본값
    var numsList: [Int] = nums
    //비교값
    var othersList: [Int] = nums
    
    //원본의 최대값 인덱스, 컴퓨터 입장에서 최대값은 없을 수 있기 때문에 옵셔널
    guard let max = nums.max() else {
        return -1
    }
    
    guard let index = nums.index(of: max) else {
        return -1
    }
    
    //최대값을 제외한 인덱스, 옵셔널의 결과값으로 옵셔널인덱스 입력
    othersList.remove(at: index)
    
    //2번째 값의 2배
    let other = othersList.max()! * 2
    //최대값
//    let num = numsList.max()!
    
//    if other > num
//    {
//        result = -1
//    }else
//    {
//        result = index!
//    }
    
    result = other > max ? -1 : index
    
    return result
}

dominantIndex([1,2,3,4])
dominantIndex([3,6,1,0])
