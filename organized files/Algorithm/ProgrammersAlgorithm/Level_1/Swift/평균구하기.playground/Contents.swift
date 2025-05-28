import UIKit

//함수를 완성해서 매개변수 array의 평균값을 return하도록 만들어 보세요.
//어떠한 크기의 array가 와도 평균값을 구할 수 있어야 합니다.

func average(numbers: Double...) -> Double {
    
    var sum: Double = 0
    var aver: Double
    
    for num in numbers
    {
        sum += num
    }
    
    aver = sum / Double(numbers.count)
    
    return aver
}

print("평균값은 \(average(numbers: 2,3,4,5,6,7))입니다.")
