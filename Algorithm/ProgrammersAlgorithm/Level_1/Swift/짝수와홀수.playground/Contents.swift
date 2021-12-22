//evenOrOdd 메소드는 int형 num을 매개변수로 받습니다.
//num이 짝수일 경우 Even을 반환하고 홀수인 경우 Odd를 반환하도록 evenOrOdd에 코드를 작성해 보세요.
//num은 0이상의 정수이며, num이 음수인 경우는 없습니다.

func evenOrOdd(num: UInt) -> String {
    var result: String
    
    if num%2 == 0 {
        result = "Even"
    }else {
        result = "Odd"
    }
    
    return result
}

// 아래는 테스트로 출력해 보기 위한 코드입니다.
print("결과 : " + evenOrOdd(num: 2));
print("결과 : " + evenOrOdd(num: 3));
