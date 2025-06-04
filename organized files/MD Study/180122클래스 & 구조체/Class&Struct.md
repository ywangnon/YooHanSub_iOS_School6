# 🧱 Class vs Struct (Swift)

Swift에서는 객체를 만들 때 **클래스(Class)** 또는 **구조체(Struct)** 를 사용할 수 있습니다.
두 타입은 문법은 유사하지만 **동작 방식과 메모리 관리 방식에서 큰 차이**가 있습니다.

---

## ✅ 공통점

* 프로퍼티(속성)와 메서드(함수)를 **같은 방식으로 정의**
* `init()`을 통해 초기화 가능
* 확장(extension), 프로토콜 채택 가능
* `let`으로 선언한 인스턴스는 내부 값 변경 불가 (Struct 기준)

---

## 🔧 기본 구조

```swift
class SomeClass {
    var name: String = ""
    func sayHello() {
        print("Hello")
    }
}

struct SomeStruct {
    var name: String = ""
    func sayHello() {
        print("Hello")
    }
}
```

---

## 🔍 차이점 비교

| 항목          | `class`                    | `struct`              |
| ----------- | -------------------------- | --------------------- |
| 타입          | **참조 타입 (Reference Type)** | **값 타입 (Value Type)** |
| 복사 방식       | 얕은 복사 (shallow copy)       | 깊은 복사 (deep copy)     |
| 상속          | 가능                         | ❌ 불가능                 |
| deinit(소멸자) | 지원                         | ❌ 미지원                 |
| 프로퍼티 변경     | `let` 선언해도 내부 변경 가능        | `let`이면 내부 변경 불가      |
| 메모리 위치      | 힙(heap)                    | 스택(stack)             |
| 인스턴스 포함 여부  | `struct` 인스턴스 포함 가능        | `class` 인스턴스 포함 불가    |

> ✅ **Struct는 Class의 인스턴스를 가질 수 없지만, Class는 Struct를 포함할 수 있습니다.**

---

## 🚀 초기화 방법 (Initializer)

### ✅ Class 초기화

클래스는 **모든 저장 프로퍼티**를 `init()` 내에서 직접 초기화해야 합니다.

```swift
class Person {
    var name: String

    init() {
        self.name = ""
    }
}
```

* 모든 프로퍼티는 `init()` 완료 시까지 반드시 초기화돼야 함
* 생성자 오버로딩 가능

### ✅ Struct 초기화

구조체는 **자동으로 초기화 메서드**가 생성됩니다.

```swift
struct User {
    var name: String
    var age: Int
}

// 자동 생성된 이니셜라이저 사용 가능
let user = User(name: "Tom", age: 20)
```

* 별도의 `init()` 없이도 모든 프로퍼티를 포함하는 **멤버와이즈 이니셜라이저** 제공
* 필요 시 사용자 정의 `init()`도 가능

---

## 🧭 언제 Class, 언제 Struct?

| 선택 기준         | 추천 타입    |
| ------------- | -------- |
| 상속이 필요하다      | `class`  |
| 값 전달이 목적이다    | `struct` |
| 참조 공유가 필요하다   | `class`  |
| 복사가 자주 일어난다   | `struct` |
| 스레드 안전성이 중요하다 | `struct` |

> ✅ Swift의 기본 타입(Int, String, Array 등)은 모두 `struct`입니다.
> Apple은 Struct 사용을 **기본 권장**합니다. 참조 공유가 명확히 필요할 때만 Class 사용하세요.

---

## 📌 요약

| 요소   | Class         | Struct           |
| ---- | ------------- | ---------------- |
| 타입   | 참조 타입         | 값 타입             |
| 복사   | 얕은 복사         | 깊은 복사            |
| 상속   | 가능            | 불가               |
| 초기화  | 수동 정의         | 자동 생성            |
| 메모리  | 힙             | 스택               |
| 주 용도 | 참조 공유, 복잡한 객체 | 단순 값 전달, 데이터 모델링 |
