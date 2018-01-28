//sum_digit함수는 자연수를 전달 받아서 숫자의 각 자릿수의 합을 구해서 return합니다.
//예를들어 number = 123이면 1 + 2 + 3 = 6을 return하면 됩니다.
//sum_digit함수를 완성해보세요.

func sum_digit(num: Int) -> Int
{
    var sum: Int = 0
    var numTemp: Int = num
    
    while numTemp%10 > 0
    {
        sum += numTemp%10
        numTemp = numTemp/10
    }
    
    return sum
}

print(sum_digit(num: 123))
