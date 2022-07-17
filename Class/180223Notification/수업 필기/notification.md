IBOutlet: 인스턴스 연결

오토레이아웃을 할 때는 어떤 것을 늘리고 어떤 것을 고정할지 생각해야한다.

메모장 만들기
오토레이아웃

Notification
- 방송국 같은 역할
- 서로 관련없는 뷰콘트롤러의 정보를 알려준다.

컨트롤러 입장
- posting 발신
- observing 수신
- 받으면 뭐 해야할지 함수 구현
- 중복으로 애드옵저빙하기 때문에 마지막에 제거해줘야한다.

notification 입장
- posting 수신 
- observing 발신
- 키값으로 등록 add observing


