/********************************************
 digit_reverse함수는 양의 정수 n을 매개변수로 입력받습니다.
 n을 뒤집어 숫자 하나하나를 list로 표현해주세요
 예를들어 n이 12345이면 [5,4,3,2,1]을 리턴하면 됩니다.
 ********************************************/

func digit_reverse(n: Int) -> [Int] {
    var list: [Int] = []
    var num: Int = n
    
    while num != 0 {
        list.append(num%10)
        num /= 10
    }
    
    return list
}

print(digit_reverse(n: 12345))
