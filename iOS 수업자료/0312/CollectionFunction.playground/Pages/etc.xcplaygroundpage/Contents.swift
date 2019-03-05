//: [Previous](@previous)
//: # etc
//: ## (enumerated, sorted, reversed)
/***************************************************
 func sequence<T>(first: T, next: (T) -> T?)
 - first 값으로 시작하여 next 값을 lazy 하게 반복하는 순열 생성
 ***************************************************/

print("\n---------- [ enumerated ] ----------\n")

for (idx, num) in [5,1,2,4,3].enumerated() {
  print(idx, num)
}


print("\n---------- [ sorted ] ----------\n")
//sort: 배열을 직접 변환함
//sorted: 배열을 새로 만들어서 변환함
for (idx, num) in [5,1,2,4,3].sorted().enumerated() {
  print(idx, num)
}

print("\n---------- [ reversed ] ----------\n")

for (idx, num) in [5,1,2,4,3].sorted().enumerated().reversed() {
  print(idx, num)
}

//: [Next](@next)
