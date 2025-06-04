# 🧬 Swift 상속 & Initializer 정리

---

## ✅ 상속 (Inheritance)

### 🔹 개념

* **상속은 클래스(Class)에만 존재**하는 개념입니다.
* 기존 클래스를 기반으로 **속성과 기능을 확장**할 수 있습니다.
* 구조체(`struct`)와 열거형(`enum`)은 상속 불가, 대신 **프로토콜을 채택(implements)** 합니다.

### 🔹 특징

| 항목      | 설명                                   |
| ------- | ------------------------------------ |
| 지원 여부   | `class`만 지원                          |
| 다중 상속   | ❌ 불가 (단일 상속만 가능)                     |
| 프로토콜 채택 | `class`와 `struct` 모두 가능 (여러 개 채택 가능) |

```swift
class Animal {
    var name = "동물"
}

class Dog: Animal {
    var breed = "시바"
}
```

---

## 🚀 클래스 초기화 (Initializers)

상속 시에는 **초기화 순서와 타입에 따라 규칙**을 따라야 합니다.

---

### 1️⃣ 지정 초기화 (Designated Initializer)

* 모든 저장 프로퍼티를 **직접 초기화**
* 상속받는 클래스는 **반드시 부모의 지정 초기화 호출 필요**

```swift
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Student: Person {
    var major: String
    init(name: String, major: String) {
        self.major = major
        super.init(name: name)  // 부모의 지정 초기화 호출
    }
}
```

---

### 2️⃣ 편의 초기화 (Convenience Initializer)

* **보조 생성자** 역할
* 자신 클래스의 다른 초기화 함수를 호출해야 함 (`self.init(...)`)
* 모든 프로퍼티를 직접 초기화하지 않아도 됨

```swift
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }

    convenience init() {
        self.init(name: "Unknown")  // 지정 초기화 호출
    }
}
```

> 🔁 **편의 초기화 → 지정 초기화 호출 (필수)**
> ❌ 지정 초기화에서 편의 초기화를 직접 호출할 수는 없음

---

### 3️⃣ required initializer

* **상속받는 모든 클래스가 반드시 구현해야 하는 초기화자**
* 주로 프로토콜을 따르거나 API 구조에서 강제 구현이 필요할 때 사용

```swift
class Person {
    var name: String
    required init(name: String) {
        self.name = name
    }
}

class Student: Person {
    required init(name: String) {
        super.init(name: name)
    }
}
```

---

## 🗑️ 소멸자 (deinit)

* 클래스에서만 지원되는 **인스턴스가 사라질 때 실행되는 메서드**

```swift
class SomeClass {
    deinit {
        print("객체 소멸")
    }
}
```

> `struct`는 참조가 아닌 값 복사이므로 소멸자 필요 없음

---

## 🆚 Class vs Struct

| 항목      | `class`            | `struct`          |
| ------- | ------------------ | ----------------- |
| 타입      | 참조 타입              | 값 타입              |
| 상속      | ✅ 가능               | ❌ 불가              |
| 타입 캐스팅  | ✅ 가능 (`as?`, `is`) | ❌ 불가              |
| 메모리     | 힙 (공유)             | 스택 (복사)           |
| 소멸자     | 지원 (`deinit`)      | 없음                |
| 메서드 변경  | 내부 자유롭게 수정 가능      | `mutating` 키워드 필요 |
| 프로토콜 채택 | 가능                 | 가능                |

```swift
struct Point {
    var x = 0
    var y = 0

    mutating func moveBy(dx: Int, dy: Int) {
        x += dx
        y += dy
    }
}
```

---

## 🧭 Struct 사용 가이드라인

구조체는 다음과 같은 상황에서 사용하는 것이 적합합니다:

* 간단한 데이터 묶음 (예: 좌표, 크기, 색상 등)
* 복사가 더 적절한 경우 (참조보다 값 전달)
* 저장된 프로퍼티가 전부 값 타입일 경우
* 상속이 필요 없는 경우

> ✅ **데이터 중심 = Struct / 동작 중심 객체 = Class**

---

## 📌 요약

| 요소                   | 설명                         |
| -------------------- | -------------------------- |
| **지정 초기화**           | 필수 초기화, 모든 프로퍼티 직접 초기화     |
| **편의 초기화**           | 보조 생성자, 다른 초기화자 호출 필수      |
| **required init**    | 자식 클래스에서 반드시 구현해야 하는 초기화자  |
| **deinit**           | 클래스 인스턴스가 메모리 해제 시 실행      |
| **Struct의 mutating** | 구조체 메서드에서 값 변경 시 사용 필수 키워드 |
