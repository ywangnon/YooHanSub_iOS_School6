//: [Previous](@previous)
//: # repeatElement
/***************************************************
 func repeatElement<T>(_ element: T, count n: Int) -> Repeated<T>
 - 동일 요소를 count 값만큼 가진 컬렉션 생성
 ***************************************************/

print("- example1 -")
let zeroes = repeatElement(0, count: 5)
for x in zeroes {
  print(x)
}

print("\n- example2 -")
for x in repeatElement(true, count: 3) {
  print(x)
}

print("\n- example3 -")
//private let printString: (String) -> () = { print($0) }
private func printString(_ str: String) { print(str) }
repeatElement("Swift", count: 3)
  .forEach(printString(_:))

//: [Next](@next)
