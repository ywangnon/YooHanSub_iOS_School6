//: # Basic
//: **Metatype > Type > Instance**
print("\n---------- [ String Type itself] ----------\n")

// 타입도 메타 타입의 객체
/***************************************************
 String.Type > String > String
 
 let str = "String"
 str : struct String 의 객체
 String : struct String 자체에 대한 참조, String 메타타입(String.Type) 의 객체.  String.self 로 접근
 String.Type : String 의 메타타입
 ***************************************************/
// 메타 타입: [1,2,3,4,5,6]의 Array가 있다면, 이 Array가 Count가 6이고, Int를 가지고 있다는 식의 정보를 가지고 있는 것.
// 변수나 함수의 뒤에 오는 것들은 그 타입의 객체를 넣으라는 의미

//let _ = Swift.NSString.init("initString")  // Error
let swiftString = Swift.String.init("initString")
let swiftStringSelf = Swift.String.self // String 구조체 자신
let swiftStringType = type(of: swiftString) // 타입 조사
let swiftStringMetatype = type(of: Swift.String.self)
let swiftStringMetatypeSelf = swiftStringMetatype.self
let swiftStringMetatypeType = type(of: swiftStringMetatype)
print(swiftString)
print(swiftStringSelf)
print(swiftStringType)
print(swiftStringMetatype)
print(swiftStringMetatypeSelf)
print(swiftStringMetatypeType)

print("\n---------- [ String Types ] ----------\n")

let str: String = "myString"
let stringSelf: String = "myString".self
let stringType: String.Type  = type(of: "myString")
let stringMetatype: String.Type.Type  = type(of: type(of: "myString"))
print(str)
print(stringSelf)
print(stringType)
print(stringMetatype)

print("\n---------- [ Protocol Types ] ----------\n")
struct S {}
class C {}
enum E {}
protocol P {}
print(type(of: S.self))
print(type(of: C.self))
print(type(of: E.self))
print(type(of: P.self))

// 프로토콜만 Protocol로 표시, 나머지는 type
//: [Next](@next)
