//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
func factorial(number: Int) -> Int {
    var result = 1
    
    for num in 1...number {
        result *= num
    }
    return result
}

factorial(number: 3)
factorial(number: 5)

func factorial2(number: Int) -> Int {
//    guard nnumber > 1 else {return 1}
    if number == 1 { return 1 }
    return number * factorial(number: number-1)
}

factorial2(number: 3)
factorial2(number: 5)
factorial2(number: 8)
factorial2(number: 10)
*/

func Fibonacci(n: Int) -> Int {
    guard n > 1 else { return n==0 ? 0 : 1}
//    guard n > 1 else { return n}
    
    return Fibonacci(n: n-1)+Fibonacci(n: n-2)
}

Fibonacci(n: 0)
Fibonacci(n: 1)
Fibonacci(n: 5)
Fibonacci(n: 9)

// 틀림
//func Hanoi(n: Int) -> Int {
//    guard n > 2 else { return n==1 ? 1 : 3 }
//
//    return 2 * Hanoi(n: n-1) - 1
//}
//
//Hanoi(n: 1)
//Hanoi(n: 2)
//Hanoi(n: 3)
//Hanoi(n: 4)
