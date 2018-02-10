## static vs class

클래스에서 프로퍼티나 메서드를 선언하는 것에는 3가지가 있다.

1. instance: 클래스를 통한 호출 불가, 클래스 실체화(Instance화)하여 생성된 인스턴스를 통하여 호출
2. static: 클래스를 통해 직접 호출
3. class: 클래스를 통해 직접 호출

static과 class는 같게 사용된다.
차이는 바로 상속이다.

static: 상속 불가
class: 상속 가능

따라서, 상속이 가능한 class에서는 class사용이 가능하지만, 상속이 불가능한 구조체(enum, struct)에서는 사용 불가

즉, 상속이 가능하게 만든 static이 class이다.

또한 하나의 클래스에서는 같은 의미를 나타내기 때문에, 상속시 class를 class와 static 두 방법으로 상속 받을 수 있다.