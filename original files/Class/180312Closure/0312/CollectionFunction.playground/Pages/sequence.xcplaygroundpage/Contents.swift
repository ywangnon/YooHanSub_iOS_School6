//: [Previous](@previous)
//: # sequence
/***************************************************
 func sequence<T>(first: T, next: (T) -> T?)
 - first 값으로 시작하여 next 값을 lazy 하게 반복하는 순열 생성
 ***************************************************/
print("\n---------- [ sequence(first:next:) ] ----------\n")

print("- example1 -")
var multiplyBy2 = sequence(first: 1) { $0 * 2 }
//multiplyBy2.forEach { print($0) }  // 무한루프
print(multiplyBy2.next()) // 스텝을 넘김
print(multiplyBy2.next())
multiplyBy2.prefix(7).forEach { print($0) }
print(multiplyBy2.next())
multiplyBy2.prefix(2).forEach { print($0) }


print("\n- example2 -")
let repeatSeq = sequence(first: 5) { $0 }
for x in repeatSeq.prefix(5) {
  print(x)
}

//: [Next](@next)

