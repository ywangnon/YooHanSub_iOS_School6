## 상속&Initializers
### 상속
- 클래스에만 존자해는 개념
- 클래스 확장 방법중 하나

### 클래스의 상속
- 단 하나만 상속 가능
- Struct, enum 상속 불가

> 구조체는 프로토콜을 받는다.   
> 클래스도 프로토콜은 여러개를. 받을 수 있다.

### 상속 초기화
- 상속받은 클래스는 상속해준 클래스도 초기화 해야한다.
- 지정 초기화&편의 초기화가 있음
- 상속 받은 클래스의 지정초기화는 안에서 부모 클래스의 지정초기화를 호출해야함
- 상속받는 클래스 안에 새로운 프로퍼티가 없으면, 부모의 초기화를 사용할 수 있음.

### 지정초기화
- 이 안에서 모든 프로퍼티를 초기화 해야함

### 편의초기화
- 이 안에서 모든 프로퍼티를 초기화 할 필요는 없음
- 단, 안에서 하나라도 지정초기화를 호출해야함

### required init
- 상속받는 클래스는 반드시 만들라고 명시해놓은 초기화

### Class vs Structure
- class: 타입캐스팅 가능, 상속 가능, 참조
- structure: 타입캐스팅 불가, 상속 불가, 값 타입
- 참조되는 부분의 구역을 잡아놓고 참조되는 것이 없어지면 그떄 지운다.
- class는 deinitializer(: 인스턴스가 사라질때 할 행동) 사용(deinit)

> struct의 경우 인스턴스 메소드 안에서 프로퍼티를 바꾸기 위해서는 mutating이라고 함수 앞에 쓴다.

### Struct 사용 가이드 라인
- 연관된 간단한 값의 집합을 캡슐화하는 것만이 목적일 때 
- 캡슐화된 값이 참조되는 것보다 복사되는 것이 합당할 때
- 구조체에 저장된 프로퍼티가 값타입이며 참조되는 것보다는 복 사되는 것이 합당할때
- 다른 타입으로부터 상속받거나 자신이 상속될 필요가 없을 때

> 데이터를 처리할 때, 구조체를 사용한다.  
> 타입에 가까울 때: Struct.  
> 객체에 가까울 때: Class.  