//printTriangle 메소드는 양의 정수 num을 매개변수로 입력받습니다.
//다음을 참고해 *(별)로 높이가 num인 삼각형을 문자열로 리턴하는 printTriangle 메소드를 완성하세요
//printTriangle이 return하는 String은 개행문자('\n')로 끝나야 합니다.
//
//높이가 3일때
//
//    *
//    **
//    ***
//    높이가 5일때
//
//    *
//    **
//    ***
//    ****
//    *****

func printTriangle(num: UInt) -> String {
    var result = ""
    // 함수를 완성하세요
    
    for i in 0..<num {
        for _ in 0..<i+1 {
            result += "*"
        }
        result += "\n"
    }
    
    return result
}


// 아래는 테스트로 출력해 보기 위한 코드입니다.
print( printTriangle(num: 3) );
print( printTriangle(num: 5) );
