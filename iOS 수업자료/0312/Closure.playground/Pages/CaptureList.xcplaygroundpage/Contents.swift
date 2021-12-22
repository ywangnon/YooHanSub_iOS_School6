//: [Previous](@previous)
//: # Value Type Capture
print("\n---------- [ Value Type Capture ] ----------\n")
var a = 1
var b = 2
var c = 10
var result = 0
print("초기화 값 :", a, b, c, result)
print("a, b 만 캡쳐")
let valueCapture = { [a, b] in
  result = a + b + c
  print("클로저 내부 값 :", a, b, c, result)
}
//선언된 부분까지의 값으로 고정됨
//플레이그라운드가 아닌 프로젝트에서는 변수의 스코프의 개념으로 생각해야함


a = 10
b = 10
c = 5
result = a + b + c
print("변경 값 :", a, b, c, result)

valueCapture()
print("실행 이후 값 :", a, b, c, result)
//: # Reference Type Capture
print("\n---------- [ RefType Capture ] ----------\n")

final fileprivate class RefType {
  var number = 0
}
fileprivate var x = RefType()
fileprivate var y = RefType()
print("초기화 값 :", x.number, y.number)

let refCapture = { [x] in
  print("클로저 내부 값 :", x.number, y.number)
}
x.number = 5
y.number = 7
print("변경 값 :", x.number, y.number)

refCapture()
print("실행 이후 값 :", x.number, y.number)

//: # Binding an arbitrary expression
print("\n---------- [ binding ] ----------\n")
let captureBinding = { [z = x] in
  print(z.number)
}
let captureWeakBinding = { [weak z = x] in
  print(z?.number ?? 0)
}
let captureUnownedBinding = { [unowned z = y] in
  print(z.number)
}
//위의 것들은 그냥 쓰면 레퍼런스 카운트를 증가시키기 때문에 weak이나 unowned로 사용해야 한다.
//weak 은 가르키고 있는 위치의 값이 nil이 되면 nil로 반환하고,
//unowned 는 주소값을 가지고 있는채로 남기때문에 사용에 주의해야한다.

captureBinding()
captureWeakBinding()
captureUnownedBinding()

//: [Next](@next)
