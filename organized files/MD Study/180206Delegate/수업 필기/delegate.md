# ✅ Delegate Pattern (델리게이트 패턴)

## 개념

* **어떤 객체가 해야 할 일을, 다른 객체에게 위임하는 디자인 패턴**
* **역할 분리와 유연한 코드 구조**를 만들 수 있음
* UIKit 등 iOS 시스템 전반에 널리 사용됨 (예: `UITableViewDelegate`, `UITextFieldDelegate`)

---

## 📌 주요 용어

| 용어             | 의미                              |
| -------------- | ------------------------------- |
| **Delegate**   | ‘대표자’, '대리자', 대신 어떤 일을 수행해주는 객체 |
| **Datasource** | 데이터 공급자, 데이터가 필요한 객체에게 데이터를 제공  |

---

## 💡 언제 쓰는가?

* **어떤 객체가 특정 동작을 직접 처리하지 않고, 외부에 맡기고자 할 때**
* 예: 텍스트 필드 입력이 끝났을 때 → ViewController가 이를 감지하고 처리

---

## ⚙️ 동작 과정

### 1. 프로토콜 정의 (약속 정의)

```swift
protocol MyDelegate: AnyObject {
    func didSomethingImportant()
}
```

### 2. 위임 받을 클래스에서 프로토콜 채택

```swift
class Worker {
    weak var delegate: MyDelegate?   // 순환참조 방지를 위해 weak 사용
    
    func doWork() {
        // 일 처리
        delegate?.didSomethingImportant() // 위임
    }
}
```

### 3. 델리게이트 역할을 수행할 클래스에서 구현

```swift
class Manager: MyDelegate {
    func didSomethingImportant() {
        print("중요한 일을 처리함!")
    }
}

let worker = Worker()
let manager = Manager()
worker.delegate = manager
worker.doWork()
// 출력: 중요한 일을 처리함!
```

---

## 🧩 필수 이해 요소

### ✅ `delegate` 프로퍼티는 왜 `weak`?

* 대부분 클래스 간 연결 → **순환 참조 방지 필요**
* 따라서 `weak var delegate`로 선언 (프로토콜은 `AnyObject` 채택 필요)

---

## 📌 UIKit에서의 대표적인 Delegate 예시

| 컴포넌트               | Delegate 프로토콜              | 예시 메서드                  |
| ------------------ | -------------------------- | ----------------------- |
| `UITextField`      | `UITextFieldDelegate`      | `textFieldShouldReturn` |
| `UITableView`      | `UITableViewDelegate`      | `didSelectRowAt`        |
| `UICollectionView` | `UICollectionViewDelegate` | `didSelectItemAt`       |

---

## ⚠️ 주의할 점

* `get set`은 프로토콜에서 **저장 프로퍼티인지, 연산 프로퍼티인지**를 명시하는 게 아님
  → 단순히 **“읽고 쓰는 기능이 필요하다”는 인터페이스 요구사항**
* 프로토콜은 구현 방법에 대한 제약을 주지 않음 → 저장이든 연산이든 구현 자유

```swift
protocol Sample {
    var value: Int { get set }  // 저장 or 연산 프로퍼티 상관없음
}
```

---

## 📚 요약

* **Delegate 패턴**은 객체 간의 결합도를 낮추고, 역할을 분리하기 위한 핵심 디자인 패턴
* iOS에서는 사용자 인터페이스 이벤트 처리와 데이터 처리에 광범위하게 사용됨
* `delegate = self`를 통해 이벤트를 자신이 처리할 수 있도록 위임 가능
