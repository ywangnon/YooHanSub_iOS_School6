# 📱 UIKit 기본 구조 및 주요 클래스 그룹 정리

---

## 1️⃣ **기본 명령어 패턴 (UIView 생성과 구성 흐름)**

```swift
// 1. 프레임 정의
let frame = CGRect(x: 20, y: 50, width: 200, height: 50)

// 2. 뷰 생성
let myView = UIView(frame: frame)

// 3. 속성 설정
myView.backgroundColor = .blue

// 4. 상위 뷰에 추가
view.addSubview(myView)
```

---

## 2️⃣ **UIKit 클래스 계층별 그룹**

### 📌 A. 루트 및 이벤트 처리 계층

| 클래스             | 설명                    |
| --------------- | --------------------- |
| `NSObject`      | 모든 클래스의 조상            |
| `UIResponder`   | 터치 및 이벤트 처리           |
| `UIApplication` | 앱 전체의 생명주기, 이벤트 루프 관리 |
| `UIWindow`      | 전체 화면을 감싸는 최상위 뷰 컨테이너 |

---

### 📌 B. 화면 단위 컨트롤러

| 클래스                | 설명                       |
| ------------------ | ------------------------ |
| `UIViewController` | 한 화면을 구성하는 컨트롤러          |
| 역할                 | 생명 주기 관리, 화면 전환, 하위 뷰 관리 |

---

### 📌 C. 기본 View 요소

| 클래스            | 설명                      |
| -------------- | ----------------------- |
| `UIView`       | 모든 UI 구성 요소의 기반         |
| `UIImageView`  | 이미지를 보여주는 뷰             |
| `UILabel`      | 텍스트 출력용 뷰               |
| `UIScrollView` | 스크롤 가능 뷰                |
| `UIControl`    | 상호작용 가능한 컨트롤 요소의 기반 클래스 |

---

### 📌 D. 상호작용 UI 컨트롤 그룹 (`UIControl` 하위)

| 클래스           | 설명             |
| ------------- | -------------- |
| `UIButton`    | 버튼 클릭 처리       |
| `UISlider`    | 슬라이더 조절 (연속 값) |
| `UISwitch`    | ON/OFF 전환 스위치  |
| `UITextField` | 한 줄 텍스트 입력 필드  |

---

## 3️⃣ **UILabel 속성 예시 그룹화**

```swift
let label = UILabel(frame: CGRect(x: 20, y: 100, width: 280, height: 40))

// 텍스트 관련
label.text = "Hello, UIKit"
label.textColor = .black
label.font = UIFont.systemFont(ofSize: 18)
label.textAlignment = .center
label.numberOfLines = 1
```

---

## 4️⃣ **Font 설정 그룹**

```swift
// 시스템 폰트
label.font = UIFont.systemFont(ofSize: 16)

// 커스텀 폰트
label.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
```

---

## 5️⃣ **UI 추가 시 일반적인 흐름 요약**

| 순서 | 설명       | 예시                                   |
| -- | -------- | ------------------------------------ |
| 1  | 프레임 정의   | `CGRect(x: , y: , width: , height:)` |
| 2  | 뷰 생성     | `UILabel(frame:)`                    |
| 3  | 속성 설정    | `text`, `backgroundColor` 등          |
| 4  | 상위 뷰에 추가 | `view.addSubview(label)`             |

---

## 6️⃣ 📘 기타 유용한 속성 & 메서드

| 속성                         | 설명                     |
| -------------------------- | ---------------------- |
| `backgroundColor`          | 배경색 설정                 |
| `alpha`                    | 투명도 설정 (0.0\~1.0)      |
| `isHidden`                 | 보이기/숨기기                |
| `clipsToBounds`            | 자식 뷰가 부모 영역 벗어날 경우 자르기 |
| `layer.cornerRadius`       | 모서리 둥글게                |
| `addTarget(_:action:for:)` | 버튼 등 컨트롤 요소에 액션 연결     |

---

## 📚 UIKit 주요 클래스 계층 구조

UIKit에서 모든 화면 구성 요소는 다음과 같은 계층을 따릅니다:

| 계층                 | 설명                                     |
| ------------------ | -------------------------------------- |
| `NSObject`         | 모든 클래스의 루트 클래스                         |
| `UIResponder`      | 이벤트 처리의 기본 클래스                         |
| `UIApplication`    | 앱의 전체 수명 주기 관리                         |
| `UIWindow`         | 앱의 화면 전체를 감싸는 컨테이너                     |
| `UIViewController` | 뷰들을 관리하는 컨트롤러                          |
| `UIView`           | 화면을 구성하는 기본 단위                         |
| `UIControl`        | 사용자 인터랙션을 감지하는 컨트롤                     |
| 하위 요소들             | `UILabel`, `UIButton`, `UITextField` 등 |

---

## 🔗 주요 UIKit 클래스 요약

### 🧩 `NSObject`

* 모든 클래스의 기본
* KVO, Notification 등 지원

### 🧩 `UIResponder`

* 이벤트 처리 흐름의 기본 클래스
* 터치 이벤트 등 처리

### 🧩 `UIApplication`

* 앱 전체를 제어 (상태 관리, delegate, 이벤트 루프)

### 🧩 `UIWindow`

* 화면의 최상단 컨테이너
* 루트 뷰 컨트롤러 설정 가능

### 🧩 `UIViewController`

* **화면 하나를 담당**하는 컨트롤러
* 화면 생명 주기 관리

### 🧩 `UIView`

* 사각형 영역
* 배경색, 테두리, 하위 뷰 추가 가능

---

## 🎨 주요 UI 구성 요소

| 클래스            | 설명             |
| -------------- | -------------- |
| `UILabel`      | 텍스트 출력용 UI 요소  |
| `UIImageView`  | 이미지 출력용 뷰      |
| `UIScrollView` | 스크롤 가능한 뷰 컨테이너 |
| `UIButton`     | 사용자 클릭 가능 버튼   |
| `UISlider`     | 범위 값 선택용 슬라이더  |
| `UISwitch`     | ON/OFF 전환용 토글  |
| `UITextField`  | 단일 줄 텍스트 입력 필드 |

---

## ✅ 요약

| 그룹     | 핵심 클래스                                                 |
| ------ | ------------------------------------------------------ |
| 루트/이벤트 | `NSObject`, `UIResponder`, `UIApplication`, `UIWindow` |
| 화면 제어  | `UIViewController`                                     |
| 기본 뷰   | `UIView`, `UILabel`, `UIImageView`, `UIScrollView`     |
| 상호작용 뷰 | `UIButton`, `UISwitch`, `UISlider`, `UITextField`      |

> **UIKit은 객체 기반 UI 구성 도구이며** 위 구조를 바탕으로 원하는 UI를 조립하듯 구성하면 됩니다.
> 처음에는 `UILabel`, `UIButton`, `UITextField`만으로도 대부분의 기본 앱을 구성할 수 있습니다.

---

## 📌 정리

UIKit 기반 iOS 앱 개발에서 핵심 구성 요소는 다음과 같습니다:

* **`UIView` 기반의 시각적 요소** 생성 및 조작
* **`UIViewController`를 통해 화면 전환 및 로직 처리**
* **`UIControl`을 이용한 사용자 인터랙션 감지 및 대응**
* **`UIFont`, `UIColor`, `CGRect` 등 다양한 속성 조합**으로 유연하게 UI 구성

> 명확한 계층 구조와 기본 명령어 사용법 숙지를 통해 UI 구현 효율성을 높일 수 있습니다.
