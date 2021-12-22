# Firebase

- Firebase 실시간 데이터베이스는 클라우드 호스팅 데이터베이스
- 데이터는 JSON으로 저장
- 연결된 모든 클라이언트에 실시간으로 동기화
- 여러 플랫폼의 모든 클라이언트가 하나의 실시간 데이터베이스 공유, 자동 업데이트로 최신 데이터 수신

## iOS에서 설치 및 설정

### 필수 조건

1. Firebase SDK 설치
2. Firebase 콘솔에서 Firebase 프로젝트에 앱 추가

### 앱에 Firebase 실시간 데이터베이스 추가

프로젝트에 `Podfile`에 다음 종속 항목이 있어야 함

``
pod `Firebase/DataBase`
``

`pod install`을 실행하고 생성된 `.xcworkspace` 파일을 엽니다.

### Firebase 데이터베이스 규칙 생성

- 실시간 데이터베이스가 제공하는 선언적 규칙언어로 데이터의 구조, 색인 생성 방법 및 데이터를 읽고 쓸 수 있는 조건을 정의 가능
- 기본적으로 데이터베이스에 대한 읽기 및 쓰기 액세스는 인증된 사용자만 데이터를 읽거나 쓸 수 있도록 제한
- 인증 설정하지 않고 시작하려면 공개 액세스를 위해 규칙을 구성 가능
- 인증하지 않을 시 모두에게 데이터베이스가 공개되므로 인증을 설정할 때 데이터베이스 다시 제한해야 함

### Firebase 실시간 데이터베이스 설정

- Firebase 앱 참조를 만들거나 사용하려면 우선 Firebase를 초기화
- 다른 Firebase 기능을 위해 이 단계를 이미 수행했다면 건너뛰어도 무방

1. `UIApplicationDelegate`에서 Firebase 모듈을 가져옴

``
import Firebase
``

2. 일반적으로 애플리케이션의 `application:didFinishLaunchingWithOptions:` 메소드에서 `FirebaseApp` 공유 인스턴스 구성

```
// Use Firebase library to configure APIs
FirebaseApp.configure()
```

Firebase 실시간 데이터베이스가 초기화되었으면 다음과 같이 데이터베잉스 참조를 정의하고 생성

```
var ref: Databasereference

ref = Database.database().reference()
```

### 실행 준비

앱을 실행하기 전에 우선 시작 체크리스트를 확인하여 앱의 준비 상태를 점검
