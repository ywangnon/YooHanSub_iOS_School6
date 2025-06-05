# 🧱 Swift UIKit Framework 정리

---

## 📦 Framework란?

> **프레임워크(Framework)** 는 특정 플랫폼(OS)에서의 **응용 프로그램 개발을 위해 제공되는 클래스 및 라이브러리의 집합**입니다.

* **재사용 가능한 코드 묶음**
* 여러 기능을 모듈화하여 제공
* 대표 예: `UIKit`, `Foundation`, `AVFoundation`, `SwiftUI` 등

---

## 🎨 UIKit Framework

> iOS에서 **UI(사용자 인터페이스)** 관련 요소를 제공하는 대표적인 프레임워크
> Cocoa Touch 계층의 일부로 포함되어 있으며, 앱 화면 구성에 필요한 대부분의 뷰 클래스가 포함됩니다.

![UI Class](./img/UIClass.png "UI Class 계층")

---

## 🧬 UIKit 주요 클래스 계층

### 1️⃣ UIResponder

* 이벤트(터치, 키 입력 등)에 **응답하는 능력**을 가진 클래스
* UIResponder를 상속받은 클래스들은 이벤트 루프를 통해 이벤트를 전달받아 처리함

> **하위 클래스 예시**: `UIView`, `UIViewController`, `UIApplication`

---

### 2️⃣ UIView

* 모든 시각적 요소의 **기본 단위**
* **화면 상의 사각형 영역**을 관리하며, 그 내부에 내용을 그리거나 하위 뷰를 가짐

```swift
let redView = UIView()
redView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
redView.backgroundColor = .red
view.addSubview(redView)
```

---

### 3️⃣ UIImageView

* 이미지를 화면에 보여주는 데 사용하는 뷰
* 정적 이미지 뿐 아니라 **애니메이션 이미지**도 지원

```swift
let imageView = UIImageView(image: UIImage(named: "logo"))
imageView.contentMode = .scaleAspectFit
```

---

### 4️⃣ UILabel

* **텍스트를 표시하는 데** 사용하는 뷰 (읽기 전용)
* 사용자 입력은 불가

#### 📌 주요 속성

| 속성              | 설명              |
| --------------- | --------------- |
| `text`          | 표시할 문자열         |
| `font`          | 폰트 스타일 및 크기     |
| `textColor`     | 텍스트 색상          |
| `textAlignment` | 정렬 방식           |
| `numberOfLines` | 줄 수 (0 = 제한 없음) |

```swift
let label = UILabel()
label.text = "Hello"
label.font = UIFont.systemFont(ofSize: 16)
label.textAlignment = .center
```

---

## 🧩 UIControl

> 사용자 인터랙션을 감지하고 **특정 동작을 수행하는 컨트롤의 기반 클래스**

* 이벤트 트리거 기능을 내장
* `UIControl`을 상속한 클래스들은 **touch, value change 등 이벤트에 반응**

### 대표 하위 클래스:

| 클래스                  | 설명            |
| -------------------- | ------------- |
| `UIButton`           | 버튼 클릭 시 액션 실행 |
| `UISwitch`           | ON/OFF 토글     |
| `UISlider`           | 슬라이드로 값 조정    |
| `UITextField`        | 단일 라인 텍스트 입력  |
| `UISegmentedControl` | 선택 항목 전환      |

---

### 5️⃣ UIButton

* **사용자 터치에 반응하여 특정 동작을 수행**하는 버튼 컴포넌트
* 다양한 상태(기본, 눌림, 비활성화)에 따라 타이틀/이미지 변경 가능

```swift
let button = UIButton(type: .system)
button.setTitle("클릭", for: .normal)
button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
```

```swift
@objc func buttonTapped() {
    print("버튼이 눌렸습니다!")
}
```

---

## 📌 UIKit 클래스 계층 요약

```plaintext
UIResponder
 └── UIView
      ├── UILabel (텍스트 출력)
      ├── UIImageView (이미지 출력)
      └── UIControl
            └── UIButton (클릭 인터랙션)
```

---

## ✅ UIKit 요약 포인트

| 구성요소          | 역할                |
| ------------- | ----------------- |
| `UIResponder` | 이벤트 처리 인터페이스      |
| `UIView`      | 시각적 요소의 기본 단위     |
| `UIImageView` | 이미지 표시 뷰          |
| `UILabel`     | 텍스트 출력 전용 뷰       |
| `UIControl`   | 사용자 이벤트 감지 기반 클래스 |
| `UIButton`    | 사용자 클릭 이벤트 처리 컨트롤 |

---

UIKit은 **UIKit 프레임워크 내 계층 구조에 따라 구성된 클래스**를 통해 시각적 인터페이스와 사용자 인터랙션을 구현합니다.
기본적으로 모든 시각적 요소는 `UIView`를 기반으로 하며, 이벤트 처리는 `UIResponder`로부터 시작됩니다.

> iOS 개발에서 UIKit을 이해하는 것은 앱의 UI 구조와 상호작용을 설계하는 데 필수입니다.
