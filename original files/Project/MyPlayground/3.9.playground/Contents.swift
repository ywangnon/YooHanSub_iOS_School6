/*
//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct Pet {
    enum PetType {
        case dog, cat, snake, pig, bird
    }
    var type: PetType
    var age: Int
}

let myPet = [
    Pet(type: .dog, age: 13),
    Pet(type: .dog, age: 2),
    Pet(type: .dog, age: 7),
    Pet(type: .cat, age: 9),
    Pet(type: .snake, age: 4),
    Pet(type: .pig, age: 5),
]

func sum() -> Int {
    var sum  = 0
    for pet in myPet {
        if pet.type == .dog
        {
            sum += pet.age
        }
    }
    return sum
}

print(sum())

func newAge() -> [Pet] {
    var newPet: [Pet] = myPet
    
    for num in 0..<newPet.count {
        newPet[num].age += 1
    }
    return newPet
}
print("===============")

var newPet = newAge()

for pet in newPet {
    print(pet.type, terminator: "\n")
    print(pet.age)
}

myPet.filter { (pet) -> Bool in
    pet.type == .dog
}

let immutableArray = Array(1...40)

func returnIndex(_ arr: [Int]) -> [Int] {
    return arr.map
        .map {
            $0-1
    }
}
print(returnIndex(immutableArray))

func even(_ arr: [Int]) -> [Int] {
    return arr
        .filter { $0 % 2 == 0 }
}
print("===============")
print(even(immutableArray))

func sum(_ arr: [Int]) -> Int {
    return arr
        .reduce(0){ $0 + $1 }
}

print("===============")
print(sum(immutableArray))
print("===============")
print(sum(even(returnIndex(immutableArray))))


let array = ["1j", "2d", "22", "33"]

let m1 = array.map({ Int($0) })
let f1 = array.flatMap({ Int($0) })

let m2 = array.map({ Int($0) }).first
let f2 = array.flatMap({ Int($0) }).first

print(m1)
print("===============")
print(f1)
print("===============")
print(m2)
print("===============")
 print(f2)
*/


