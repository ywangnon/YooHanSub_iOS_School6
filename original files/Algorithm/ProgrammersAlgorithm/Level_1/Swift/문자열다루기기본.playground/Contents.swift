//alpha_string46함수는 문자열 s를 매개변수로 입력받습니다.
//s의 길이가 4혹은 6이고, 숫자로만 구성되있는지 확인해주는 함수를 완성하세요.
//예를들어 s가 a234이면 False를 리턴하고 1234라면 True를 리턴하면 됩니다

func alpha_string46(s: String) -> Bool {
    var result: Bool = false
    
    if s.count == 4 || s.count == 6 {
        if Int(s) != nil {
            result = true
        }
    }
    
    return result;
}


// 아래는 테스트로 출력해 보기 위한 코드입니다.
print(alpha_string46(s: "a234") );
print(alpha_string46(s: "1234"))
