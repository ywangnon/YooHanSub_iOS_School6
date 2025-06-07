# 📡 NotificationCenter (노티피케이션 센터)

iOS에서 **컴포넌트 간의 메시지를 전달하는 시스템**. 뷰 컨트롤러 간, 혹은 객체 간 직접 참조 없이 **정보를 주고받기 위해 사용**하는 **Observer Pattern**의 대표 구현체입니다.

---

## ✅ NotificationCenter란?

* **iOS 시스템 전역의 메시지 브로커**
* 한 객체가 **방송(posting)** 하고, 다른 객체가 **수신(observing)** 함
* 서로 직접 연결되지 않은 객체 사이에서도 통신 가능
* 대표적 예: 키보드 등장/사라짐, 앱 상태 변경, 커스텀 이벤트 등

---

## 🔁 기본 구성요소

| 역할          | 메서드                                   | 설명                  |
| ----------- | ------------------------------------- | ------------------- |
| **Post**    | `NotificationCenter.post(...)`        | 알림을 전파              |
| **Observe** | `NotificationCenter.addObserver(...)` | 알림을 수신              |
| **Remove**  | `NotificationCenter.removeObserver`   | 옵저버 제거 (메모리 해제 중요!) |

---

## 📚 사용 예제

### 1. 📤 알림 보내기 (Posting)

```swift
NotificationCenter.default.post(
    name: Notification.Name("CustomNotification"),
    object: nil,
    userInfo: ["info": "Hello!"]
)
```

* `name`: 알림의 식별자
* `object`: 알림과 관련된 객체 (보통 nil 또는 self)
* `userInfo`: 추가 정보를 전달할 때 사용 (딕셔너리)

---

### 2. 📥 알림 받기 (Observing)

```swift
NotificationCenter.default.addObserver(
    self,
    selector: #selector(handleNotification(_:)),
    name: Notification.Name("CustomNotification"),
    object: nil
)

@objc func handleNotification(_ notification: Notification) {
    if let info = notification.userInfo?["info"] as? String {
        print("알림 수신: \(info)")
    }
}
```

* `selector`로 지정한 함수는 `@objc` 필요
* 전달받은 `Notification` 객체에서 `userInfo`, `object` 등 추출 가능

---

### 3. 🧹 옵저버 제거 (메모리 누수 방지)

```swift
deinit {
    NotificationCenter.default.removeObserver(self)
}
```

* `viewDidDisappear`, `deinit` 등에서 **제거 필수**
* **중복 addObserver 주의** (한 객체가 여러 번 등록되면 같은 알림을 여러 번 수신)

---

## 🧠 내부 동작 개념

* **Post → 브로드캐스트 → 등록된 옵저버에게 전달**
* 옵저버는 등록된 `selector` 함수로 메시지를 처리
* 옵저버는 `Notification.Name`을 키(key)처럼 사용하여 특정 이벤트만 수신

---

## 💡 유의사항

* Notification은 **비동기적으로 실행**
* `Notification.Name`은 상수로 관리하는 것이 안전

```swift
extension Notification.Name {
    static let customNotification = Notification.Name("customNotification")
}
```

---

## 🔁 NotificationCenter vs Delegate vs Closure

| 방식               | 특징                 | 사용 예시                  |
| ---------------- | ------------------ | ---------------------- |
| **Notification** | 여러 객체에게 메시지 브로드캐스트 | 키보드 알림, 앱 상태 등 시스템 이벤트 |
| **Delegate**     | 하나의 특정 객체에게 작업 위임  | UITextFieldDelegate 등  |
| **Closure**      | 함수 자체를 변수처럼 전달     | 비동기 콜백, UI 이벤트 핸들링 등   |

---

## 📦 Notification 사용 흐름 예시

1. `ViewControllerA`가 `ViewControllerB`에게 특정 이벤트를 알려야 함
2. A에서 Notification을 **post**
3. B는 `addObserver`를 통해 수신 대기
4. 알림이 발생하면 B의 `@objc func`가 자동 호출되어 반응

---

## 🧩 기타

* `UIResponder.keyboardWillShowNotification` 등 **시스템 알림**도 NotificationCenter 기반
* 사용자 정의 알림 외에도 다양한 **내장 알림**이 존재함
* SwiftUI에서는 `onReceive()`로 대체 사용 가능
