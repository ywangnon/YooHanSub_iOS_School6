//: [Previous](@previous)
//: # print, debugPrint, dump

var name = "crazy"
print(" dog", to: &name)
print("=====================[구분]=====================")
print(name)

print("\n---------- [ double ] ----------\n")
print(Double(99.99))
debugPrint(Double(99.99))
dump(Double(99.99))

print("\n---------- [ string ] ----------\n")
print("string")
debugPrint("string")
dump("string")

print("\n---------- [ array ] ----------\n")
print([1,2,3,4])
debugPrint([1,2,3,4])
dump([1,2,3,4])

print("\n---------- [ dict ] ----------\n")
print(["a": 1, "b": 2, "c":3])
debugPrint(["a": 1, "b": 2, "c":3])
dump(["a": 1, "b": 2, "c":3])

//: [Next](@next)
