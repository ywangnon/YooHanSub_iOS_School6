View Controller
- UIView Controller: 일반적인
- Container View Controller: 다른 뷰를 가지고 있는

App delegate
1. VC 인스턴스 만들기
2. window 인스턴스 만들기
3. window rootVC 지정

navigationItem: 각각의 화면의 바 설정

plist 데이터는 덮어쓰기해야한다. 바로 append 안된다.

userDefault는 딕셔너리 구조지만, 딕셔너리처럼 사용하면 안된다!!!

하나의 키값에 관련된 자료(하나의 밸류가 아니다!!)를 넣어서 사용하는 것이다.