# Closure Advanced
- 좀 더 손쉽게 사용하기 위함

> **주의**: 남들이 이해하기 적당한 선에서 축약 문법 사용

```
func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> {
return method(a, b)
}

print(result) // 20
```

## 후행 클로저
- 클로저가 함수의 마지막 전달인자라면 마지막 매개변수 이름을 생략한 후 함수 소괄호 외부에 클로저를 구현할 수 있다.

```
result = calculate(a: 10, b: 10) 
{ (left: Int, right: Int) -> Int in
	return left + right
}

print(result) // 20
```

## 반환타입 생략
- 컴파일러도 Method 매개변수의 반환타입을 알고 있기 때문에, 명시적으로 알려주지 않아도 된다.
- 후행 클로저에도 사용할 수 있다.

```
result = calculate(a: 10, b: 10, method: { (left: Int, right: Int) in return left + right
})

print(result) // 20
```

## 단축 인자이름

## 암시적 반환 표현