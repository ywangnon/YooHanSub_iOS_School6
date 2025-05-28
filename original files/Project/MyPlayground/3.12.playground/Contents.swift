//: Playground - noun: a place where people can play
/*
import UIKit

var str = "Hello, playground"

final class Person {
    let name = "홍길동"
    let age = 20
}

final class Person1 {
    let name = "홍길동"
    let age = 20
}

let person = Person()
let person1 = Person1()

print(person)
print(person1)

debugPrint(person)
debugPrint(person1)
print("=====================[구분]=====================")
dump(person)
dump(person1)

print(String(describing: person))
print(String(describing: person1))

print(String(reflecting: person))
print(String(reflecting: person1))

extension Person1: CustomStringConvertible, CustomDebugStringConvertible {
    
    var description: String {
        return "myDescripting: \(self.name), \(self.age)"
    }
    
    var debugDescription: String {
        return "myDebugDescription"
    }
}

print("=====================[구분]=====================")

print(person1.description)
print(person1.debugDescription)



print(String(1))

struct Dog {
    let age = 1
}

let dog = Dog()
//print(String(dog))
print(String(describing: dog))

struct Cat: LosslessStringConvertible {
    let age = 1
    let description: String
    init?(_ description: String) {
        self.description = description
    }
}

let cat = Cat("I'm a cat")!
 print(String(cat))

print("=====================[exam1]=====================")
let strideThrough = stride(from: 0, to: 7, by: 3)
var iterator = strideThrough.makeIterator()
while let element = iterator.next() {
    print(element)
}

print("=====================[exam2]=====================")
for i in stride(from: 0, to: 11, by: 2) {
    print(i, terminator: " ")
}
print()

print("=====================[exam3]=====================")
for radians in stride(from: 0.0, to: .pi * 2, by: .pi / 2) {
    let degrees = Int(radians * 180 / .pi)
    print("Degrees: \(degrees), radians: \(radians)")
}

print("=====================[exam1]=====================")
let words = ["일", "이", "삼", "사"]
let numbers = 1...4

for (word, number) in zip(words, numbers) {
    print("\(word): \(number)")
}

print("=====================[exam3]=====================")
let names = ["James", "Edward", "John", "Jessie", "Julia"]
let scores = [100, nil, 90, nil, 70, nil]
zip(names, scores).forEach {print($0, $1)}

func performClosure(param: (String) -> Int) {
    print(param("Swift"))
}
*/

func performClosure(param: (String) -> Int) {
    print(param("Swift"))
}

performClosure(param: { (str: String) -> Int in
    return str.count
})

performClosure(param: { (str: String) in
    return str.count
})

performClosure(param: { str in
    return str.count
})

performClosure(param: {
    return $0.count
})

performClosure(param: {
    $0.count
})

performClosure(param: ) {
    $0.count
}

performClosure() {
    $0.count
}

performClosure { $0.count }

//: [Next](@next)




func add(n1: Int, n2: Int) -> Int {
    return n1 + n2
}

add(n1: 3, n2: 5)

add(n1: 5, n2: 6)







