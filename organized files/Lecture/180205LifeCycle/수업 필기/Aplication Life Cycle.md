# 📱 iOS Application Life Cycle & 구조

---

## 1️⃣ App 구조 및 동작 흐름 (앱 시작)

```
main() → UIApplicationMain() → AppDelegate.swift → SceneDelegate.swift → ViewController
```

### ✔️ 앱 시작 순서 요약

1. **UIApplication** 객체 생성 (앱의 생명주기 및 이벤트 루프 관리)
2. **UIApplicationMain** 함수 실행
3. **AppDelegate** 객체 생성 및 연결
4. **Launch 화면** 표시
5. **Main Interface** (스토리보드 Initial ViewController) 호출
6. **ViewController**의 생명주기 메서드 실행 (`viewDidLoad` → `viewWillAppear` → `viewDidAppear`)

> 초기 진입 뷰는 **스토리보드의 Initial View Controller 설정에 따라 결정**, 이는 앱 전체 시작과는 다름

---

## 2️⃣ Event 처리 흐름

* iOS는 **이벤트 기반 시스템**
* **Event Queue**를 통해 사용자 입력 이벤트 처리 (FIFO)
* 이벤트들은 `UIApplication`이 받아 `UIResponder` 체인을 따라 전달

### 🔄 이벤트 전달 체계

```
UIApplication → UIWindow → ViewController → View
```

* **터치 이벤트**는 최종적으로 해당 View에게 전달
* 각 요소는 `UIResponder`를 상속하여 이벤트를 받을 수 있음

---

## 3️⃣ Application 상태 (Execution States)

| 상태          | 설명                           |
| ----------- | ---------------------------- |
| Not Running | 앱이 실행되지 않은 상태                |
| Inactive    | 실행 중이지만 이벤트를 받지 않음 (전화 수신 등) |
| Active      | 실행 중이며 이벤트 수신 가능 (정상 상태)     |
| Background  | 백그라운드에서 코드 실행 가능             |
| Suspended   | 메모리 절약을 위해 대기 (코드 실행 X)      |

> 상태 변경은 **`AppDelegate` 또는 `SceneDelegate`** 를 통해 감지 및 처리

---

## 4️⃣ AppDelegate 주요 메서드 정리

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
```

| 상태 전환    | 메서드                              | 설명               |
| -------- | -------------------------------- | ---------------- |
| 앱 실행 완료  | `didFinishLaunchingWithOptions`  | 앱이 실행되어 초기 설정 수행 |
| 활성화 직전   | `applicationWillResignActive`    | 홈 버튼 누름, 전화 수신 등 |
| 백그라운드 진입 | `applicationDidEnterBackground`  | 데이터 저장 등 백업 처리   |
| 포그라운드 진입 | `applicationWillEnterForeground` | 화면 복귀 전 준비       |
| 활성화 완료   | `applicationDidBecomeActive`     | 사용자 입력 가능        |
| 앱 종료     | `applicationWillTerminate`       | 앱 종료 전 처리, 백업 등  |

> iOS 13 이상은 `SceneDelegate`에서 유사 메서드 존재 (멀티 윈도우 환경 대응)

---

## 5️⃣ SceneDelegate 요약 (iOS 13+)

```swift
func sceneDidBecomeActive(_ scene: UIScene) { }
func sceneWillResignActive(_ scene: UIScene) { }
func sceneDidEnterBackground(_ scene: UIScene) { }
func sceneWillEnterForeground(_ scene: UIScene) { }
```

> 앱의 각 **Scene(화면)** 의 상태 관리를 담당하며, AppDelegate보다 세분화됨

---

## 6️⃣ 상태 전환 예시 플로우

### 앱 실행

```
didFinishLaunchingWithOptions → didBecomeActive
```

### 홈 버튼 누름

```
willResignActive → didEnterBackground
```

### 앱 복귀

```
willEnterForeground → didBecomeActive
```

### 앱 강제 종료 (예: Xcode에서 Stop)

```
Message from debugger: Terminated due to signal 9
```

---

## 7️⃣ 유의사항

* **Storyboard의 Initial ViewController**는 앱 실행 시 표시되는 첫 화면이며, 앱 진입 자체와는 무관함
* 런타임 중 코드로 다시 ViewController를 설정하면 **Storyboard 설정은 덮어쓰기됨**

  ```swift
  a = 3
  a = 5  // → 마지막 값만 유효
  ```

---

## 8️⃣ 핵심 요약

| 구성 요소            | 역할               |
| ---------------- | ---------------- |
| `UIApplication`  | 앱 전체의 런타임 환경 관리  |
| `AppDelegate`    | 앱 생명주기 전반 처리     |
| `SceneDelegate`  | 각 화면(윈도우)의 상태 관리 |
| `ViewController` | 사용자 인터페이스 제어     |

