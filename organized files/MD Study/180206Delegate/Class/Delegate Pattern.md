## Delegate Pattern

- 특정 클래스가 하는 일 중 일부를 자신의 커스텀 클래스에서 대신 처리하기 위해 사용할 수 있는 패턴

### **Delegate**
 
1. 대표자
2. 위임하다
3. 뽑다


**다른 객체가 할 일을 다른 객체에 넘기는 것**

## Delegate 과정

1 - 채택과정

> 사용할 프로토콜을 채택<br>
> class `ClassName`: Type, `채택할 protocol`

2 - 대신 일 할 객체 선택

> `객체`.delegate = `대신 일할 객체`

3 - 구현

> 오버라이드를 통해 역할에 맞는 함수 구현<br>
> func `textFieldShouldReturn`(_ textField: UITextField) -> Bool {
> ...
> }

- 대신할 동작의 함수를 불러와 그 함수안에 할일을 구현