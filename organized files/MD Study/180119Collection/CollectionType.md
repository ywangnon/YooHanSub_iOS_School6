# 📚 Swift Collection Types 정리

Swift에는 데이터를 그룹으로 저장하고 관리하기 위한 세 가지 주요 **컬렉션 타입**이 있습니다:

* **Array**
* **Set**
* **Dictionary**

> 💡 **컬렉션은 모두 타입(Collection Type)** 입니다. 즉, `Array`, `Set`, `Dictionary`는 \*\*구조체(struct)\*\*로 정의된 \*\*값 타입(Value Type)\*\*입니다.

---

## ✅ 공통 특징

* `var`로 선언해야 컬렉션의 내용 변경 가능
* `let`으로 선언된 컬렉션은 **요소 변경 불가**
* 컬렉션은 **구조체(값 타입)** 이므로 `let`으로 선언하면 내부 데이터도 **불변**

```swift
let arr = [1, 2, 3]
arr.append(4) // ❌ 오류
```

> ⚠️ 클래스 인스턴스는 `let`으로 선언해도 내부 프로퍼티 수정 가능
> 컬렉션은 구조체이므로 값 전체가 변경 불가

---

## 📐 Array (배열)

### 📌 특징

* **순서가 있는** 데이터 모음
* **인덱스(0부터 시작)** 로 요소 접근
* **동일한 타입**의 값 저장
* **삽입 순서 유지**

### 📌 선언 방식

```swift
var array1: Array<Int> = [1, 2, 3]
var array2: [String] = ["A", "B", "C"]
let emptyArray: [Double] = []
```

> 타입 생략 시 리터럴 타입 추론으로 `[Int]`, `[String]` 등 결정됨

### 📌 주요 메서드

```swift
array.append(4)
array.remove(at: 0)
array.contains(2)
array.count
```

### 📌 주의

* 배열을 반복문에서 수정하는 경우 주의!
  `for-in`은 시작 시 고정된 길이로 순회

---

## 🌀 Set (집합)

### 📌 특징

* **순서 없음**
* **중복 불가**
* 배열보다 **탐색 속도 빠름**
* 요소 타입은 `Hashable`을 따름

```swift
var set: Set<Int> = [1, 2, 3, 3]  // 중복 제거됨 → [1, 2, 3]
```

### 📌 선언 방식

```swift
let set1: Set<String> = ["a", "b", "c"]
let set2: Set = [1, 2, 3] // 타입 추론
```

> 리터럴은 Array와 동일 (`[]`)
> 타입 추론을 하지 않으면 `Set`이 아닌 `Array`로 간주될 수 있음

### 📌 주요 메서드

```swift
set.insert(4)
set.contains(2)
set.remove(3)
set.sorted()  // → Array 반환
```

> Set을 정렬하면 Array로 변환됨

---

## 🔑 Dictionary (딕셔너리)

### 📌 특징

* **Key-Value** 형태의 데이터 저장소
* **순서 없음**
* **Key는 고유**, **Value는 중복 가능**
* 내부 구조는 **Hash Table**

```swift
var dict: [String: Any] = [
    "name": "Tom",
    "age": 20
]
```

### 📌 선언 방식

```swift
var user: Dictionary<String, Int> = ["score": 100]
var config: [String: String] = [:]
```

### 📌 접근 및 수정

```swift
let name = dict["name"]  // Optional(Any)

if let name = dict["name"] as? String {
    print(name) // 다운캐스팅 후 사용
}

dict["age"] = 30           // 값 수정
dict.updateValue("Tom", forKey: "name") // 새로 등록 or 수정
```

> `updateValue(_:forKey:)`:
> 기존 키가 있으면 수정, 없으면 추가 → **추가와 삽입 구분 없음**

### 📌 Down Casting

* `Any` 타입에서 원하는 타입으로 변환하려면 **다운 캐스팅 필요**

```swift
if let age = dict["age"] as? Int {
    print(age)
}
```

> `as?` 는 옵셔널 캐스팅, `as!` 는 강제 캐스팅 (위험)

---

## 🔍 리터럴 vs 상수 vs 타입캐스팅

| 항목        | 설명              | 예시                    |
| --------- | --------------- | --------------------- |
| **리터럴**   | 고정된 값 자체        | `1`, `"A"`, `[1,2,3]` |
| **상수**    | 변하지 않는 변수       | `let a = 1` (`a`는 상수) |
| **타입캐스팅** | 타입 변경(새로운 값 생성) | `String(1)` → `"1"`   |

> 리터럴도 내부적으로는 구조체(예: `Int`는 `struct Int`)
> `Any`는 모든 타입을 담을 수 있는 특수 타입. 실제 타입 확인은 `type(of:)`로 가능

---

## 🧰 유용한 Xcode 단축키

| 단축키                         | 기능                |
| --------------------------- | ----------------- |
| `Control + Command + Click` | 정의된 위치(헤더) 보기     |
| `Option + Click`            | Quick Help 팝업 보기  |
| `Shift + Command + O`       | 심볼 검색 (파일, 클래스 등) |
