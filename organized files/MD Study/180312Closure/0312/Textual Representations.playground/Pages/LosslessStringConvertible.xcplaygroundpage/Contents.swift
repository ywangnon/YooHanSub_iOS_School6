//: [Previous](@previous)
//: # LosslessStringConvertible
final class Person: LosslessStringConvertible, CustomDebugStringConvertible {
  let name = "홍길동"
  let age = 20
  let description: String
  init() {
    description = name
  }
  init?(_ description: String) {
    self.description = description
  }
  var debugDescription: String {
    return "\(name): \(age)"
  }
}

let person = Person()
print(String(person))
print(String(describing: person))
print(String(reflecting: person))
debugPrint(person)
dump(person)

print("\n---------- [ init with description ] ----------\n")
let person2 = Person("description 지정")
print(String(person2!))
print(String(describing: person2))

print("\n---------- [ dump ] ----------\n")
dump(person)
print("\n---------- [ custom dump ] ----------\n")
dump(person, name: "myDump", indent: 4, maxDepth: 1, maxItems: 3)
//: [Next](@next)

