//: [Previous](@previous)
//: # CustomStringConvertible
final class Cat: CustomStringConvertible, CustomDebugStringConvertible {
  let name = "Bori"
  let age = 2
  var description: String {
    return "name: \(name)"
  }
  var debugDescription: String {
    return "name: \(name) and age: \(age)"
  }
}

let cat = Cat()
print(cat)
debugPrint(cat)
dump(cat)

//: [Next](@next)
