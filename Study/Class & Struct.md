# Class & Struct
## 공통
- 같은 문법으로 프로퍼티와 메서드 정의

## 구조
```
class someCLass {

}

struct someStruct {

}
```
## 차이  

Class | Struct
 ---	| ---
struct의 인스턴스를 가질 수 있다.|class의 인스턴스를 가질 수 없다.
ReferenceType|ValueType

## 초기화
- 인스턴스를 만들기 위한 준비 과정
- **class**: init() {}을 통해 초기화
 - init 함수가 끝났을때 모든 프로퍼티가 초기화 되어 있으면 됨

```
class Person
{
	var name: String
	
	init() {
		name = ""
	}
}
```
- **struct**: 자동으로 가지고 있는 전체 프로퍼티 초기화  함수 사용

