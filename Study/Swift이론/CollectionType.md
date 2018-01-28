# Collection Type

## 공통
- var 로 변경
- Collection은 Type이다!!!

> 클래스와 같은 형태로 사용되지만, let 으로 설정된 클래스는 클래스.함수 로 변경 가능하지만, let 컬렉션은 컬렉션.함수로 변경 불가  
> 클래스 vs 스트럭트의 차이

## Array
- 인덱스(번호)로 구분하는 자료구조
- 넣는 데이터형(종류)이 같고, 넣은 순서대로 순차적으로 저장


### Array 문법
- Array< dataType >: 제네릭과 같음
- [dataType]
- 리터럴은 [] 사용
- 축약하더라도 타입은 무조건 정해야 한다.

> 리터럴: 변하지 않는 데이터값(메모리 위치)  
> 상수: 변하지 않는 변수(메모리 안의 값)  
> let a = 1  
> a는 상수, 1은 리터럴   
> 인스턴스 생성시 원래는 Person()->Person.init()
> 타입캐스팅은 리터럴을 바꾼게 아니라 새로 타입을 바꿔서 만든것  
> 리터럴도 구조체.    
> Any와 Int의 계산?
> Any는 어떻게 타입을 구분하나?
> Any 1과 Int 1은 다른 것?
> 헤더 검색
> contl + command + click
> shift + command + o
> option + click: quick help -> declare in(공식문서)

## Set
- 순서 없음
- 중복 없음
- 무조건 다 봐야함(for-in 사용)
- Set.함수(배열) = SetType
- Set을 정렬(sorted)하면 Array

### 리터럴
- 리터럴은 똑같다.
- 타입추론하면 Array로 됨
- AnyType를 많이 씀

##Dictionary
- 순서 없음
- 키값을 통해 구분
- 해쉬테이블 사용
- 보통 [String: Any]
- 키 중복 불가, 값 중복 가능

### Down casting
- 키값을 통해 Any를 불러오면 다운 캐스팅 해야함
- as
- 실제 데이터에서 임시로 강제 형변환 한 것(눈가리고 아웅)

> 다른 Int -> String 형변환처럼 새롭게 만드는 것이 아니다!!

추가, 삽입이 없다.
- update명령어로 다 함.
- 기존에 있는 키값이면 값 바꿈, 기존에 없는 키면 등록
