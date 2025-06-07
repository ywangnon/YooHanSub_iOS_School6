# 📘 iOS 개발자 협업 및 기술 정리

---

## ✅ Git 브랜치 전략 및 협업 모델

### 1. Centralized Workflow (중앙집중형 워크플로우)

* 브랜치 없이 `main/master`에서만 작업
* 협업 시 항상 `git pull` 이후 `push`
* **단점**: 충돌 발생 가능성 높고, 이력 관리 어려움
* **적합**: 소규모, 개인 프로젝트

---

### 2. Feature Branch Workflow

* `main/master`: 출시용
* `develop`: 개발 통합용
* 각 기능별 브랜치(`feature/`) 생성 후 `develop`으로 병합
* `main`은 항상 릴리즈 가능한 상태 유지

---

### 3. Git Flow

* 실제 현업에서 많이 사용되는 브랜치 전략

```plaintext
main       ← 릴리즈 완료 상태
|
└─ develop ← 개발 통합 브랜치
    ├─ feature/login
    ├─ feature/settings
    └─ release/1.0.0 → hotfix/1.0.1 → main
```

* `release` 브랜치를 따로 만들어 버전 관리
* 긴급 수정은 `hotfix/버전명`에서 처리 → `main`과 `develop`에 병합
* **장점**: 릴리즈 안정성, 버전 단위 추적 용이
* **단점**: 브랜치 관리 복잡

---

### 4. Forking Workflow (외부 협업에 적합)

* GitHub에서 타인의 레포를 **Fork** 후 수정
* **Pull Request**를 통해 제안 → 상대방이 검토 후 `merge`
* **오픈소스 협업, 사내 공유 프로젝트**에 적합

---

## 🗂️ 협업 프로세스 및 업무 도구

### 🛠 Git Push 권한 관리

* 팀원에게 특정 브랜치 `push 권한`을 할당하거나 제한
* 보통 `main/master`는 보호(Protected Branch) 설정
* PR 승인 후 `merge`하는 방식 권장

### 📌 Git Stash

* 현재 작업 내용 임시 저장

```bash
git stash
# 작업 공간 깨끗해짐
git checkout 다른브랜치
git stash pop  # 다시 복원
```

### ✅ 업무 도구 & 문화

* **칸반(Kanban)**: 업무 진행 현황 시각화 (예: Jira, Trello)

  * "To Do" → "Doing" → "Done" 구조
* **Mid-up(미드업)**: 정기적인 팀 모임, 공유 미팅
* **블로그 확인**: 회사마다 정의된 개발 프로세스 존재 → 사내 기술 블로그 확인 필수

---

## 🧱 iOS 아키텍처

| 아키텍처      | 설명                                                         |
| --------- | ---------------------------------------------------------- |
| **MVC**   | Model-View-Controller. 전통적 구조, ViewController에 로직이 몰리는 단점  |
| **MVVM**  | Model-View-ViewModel. ViewModel에서 로직 처리, Rx/Combine과 자주 사용 |
| **VIPER** | View-Interactor-Presenter-Entity-Router. 책임 명확, 복잡도 ↑      |
| **MAP**   | Model-Adapter-Presenter 구조. 데이터 매핑에 특화된 커스텀 구조             |

---

## ⚙️ 앱 실행과 메모리

### 앱 실행 순서

1. `main.swift` → `UIApplicationMain()` 실행
2. `AppDelegate` 생성 → `didFinishLaunchingWithOptions`
3. `SceneDelegate` 설정 → 최초 ViewController 로딩
4. `viewDidLoad` → `viewWillAppear` → `viewDidAppear`

### ARC & Memory Management

* **ARC (Automatic Reference Counting)**: 참조 횟수 기반 메모리 관리
* **Strong / Weak / Unowned**: 순환참조(Strong Cycle) 방지
* 클로저에서 `[weak self]`, `[unowned self]` 사용 필수

---

## 🧩 클로저 & 블록

### 클로저

* 실행 가능한 코드 블록

```swift
let greet = { print("Hello") }
greet()
```

* **비동기 작업**, **콜백 처리**, **UI 갱신** 등에 자주 사용
* **캡처리스트**로 메모리 관리

---

## 🧪 테스트 및 알고리즘

* **알고리즘 학습**: 문제 해결 능력 + Swift 문법 활용
* 예: 백준, 프로그래머스, LeetCode 활용
* **Unit Test, UI Test** 활용

---

## 📱 시뮬레이터

* **커스텀 시뮬레이터**: Xcode → Device → Manage Device → Custom Simulator 생성 가능
* 다양한 화면 사이즈 및 iOS 버전 테스트에 활용

---

## 📌 Git 관련 참고

* 진유림(Jay Jin)
