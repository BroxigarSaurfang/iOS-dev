# Swift 언어 개발문서

## 상수와 변수

- let constants = 한번 지정되고 난 후에는 변결 불가
- var variables = 값이 지정되고 난 후에도 변경 가능

``` 
var x = 0.0, y = 0.0, z = 0.0 
```
콤마로 구분해서 한줄에 여러개의 상수나 변수를 선언하는 것도 가능


## 타입명시

- "String 타입의" 라는 말은 어떤 String값이든 저장할 수 있다. 라는 의미
- 만약 상수나 변수를 정의하는 지점에 초기값을 지정한다면, Swift는 그 상수나 변수를 위해 사용할 타입을 추측한다. 이것이 바로 **타입 세이프** 와 **타입 추정**.

## 정수(Integers)

- 부호 없는 8비트 정수형 **UInt8**, 부호있는 32비트 정수형 **Int32**
- 특별히 현재 플랫폼 해당 워드 크기의 부호없는 정수형이 필요할 때만 **UInt**를 사용. 그런 경우가 아니라면 양수만 저장하는 경우일지라도 **Int** 가 더 적절하다. 정수형을 위한 **Int** 의 일관성이 코드가 **타입 세이프** 와 **타입 추정** 으로 묘사되는 다른 숫자 형태로의 변환 또는 정수의 추정 타입일치가 필요한 경우를 피해 상호처리가 가능하도록 한다.

## 부동 소수점 수
- 부동 소수점 타입은 **Int** 타입에 저장될 수 있는 것보다 훨씬 크거나 작은 숫자를 저장하거나 더 넓은 범위의 숫자를 표현할 수 있다
- **Double** 은 64비트 부동 소수점 수를 표현. 매우 크거나 특별히 정밀한 부동 소수점 값을 원할 경우 사용 - 최소 15자리의 소수를 표현
- **Float** 은 32비트 부동 소수점 수를 표현. 64비트의 정밀함이 필요하지 않은 경우 사용 - 6자리 소수를 표현

## 타입 세이프와 타입 추정
- Swift는 타입 세이프 언어
- 코드의 어떤 부분에서 String 타입이 기대된다면 실수로 Int타입을 전달하는 것은 불가능
- 타입 추정은 값의 타입을 명시하지 않는 경우 코드를 컴파일 할때 프로그래머가 공급한 값을 가지고 컴파일러가 자동적으로 특정 표현식의 타입을 알아내도록 한다.

## 숫자의 문자표현
정수표현은 다음과 같이 표현

- 10진수는 아무런 접두어 없이
- 2진수는 접두어 **0b** 를 붙여서
- 8진수는 접두어 **0o** 를 붙여서
- 16진수는 접두어 **0x** 를 붙여서

다음은 십진수 17을 나타내는 문자표현들이다.

```
let decimalInteger = 17
let binaryInteger = 0b0001
let octalInteger = 0o21
let hexadecimalInteger = 0x11
```

부동 소수점 수의 문자 표현은 10진수(접두어 없이) 혹은 16진수(접두어 **0x**를 붙여서) 가 될수 있다. 이런 문자표현은 소수점 앞뒤로 항상 숫자(혹은 16진수 숫자)를 갖는다.
또 이것은 10진수의 소수점을 나타내기 위한 대소문자 **e** 혹은 16진수의 소수점을 나타내기 위한 **p**로 표현되는 지수를 가지고 있을 수도 있다.

**exp** 지수를 가지고 있는 10진수는 기수에 10의 exp승을 곱해 얻을 수 있다.

- **1.25e2**는 1.25 x 10^2, 나 **125.0**을 뜻한다.
- **1.25e-2**는 1.25 x 10^-2, 나 **0.0125**를 뜻한다.

**exp** 지수를 가지고 있는 16진수는 기수에 2의 exp승을 곱해 얻을 수 있다

- **0xFp2** 15 x 2^2, 나 **60.0**을 뜻한다. - **0xFp-2** 는 15 x 2^-2, 나 **3.75**를 뜻한다.

다음 부동 소수점 수의 문자표현은 모두 10진수 **12.1875**의 값을 갖는다.

```
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0
```

숫자의 문자표현은 좀 더 쉽게 읽을 수 있도록 추가 형식을 포함하기도 한다. 정수나 소수 모두 좀 더 읽기 쉽도록 여분의 0이나 _(underscores)를 포함할 수 있다. 두 양식 모두 문자표현의 실제 값에는 영향을 주지 않는다.

```
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1
```

### 정수와 실수의 변환
```
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine
```
위 예제에서 덧셈을 위해서 양쪽의 타입이 동일하도록 상수값 3을 **Double** 타압의 값으로 바꾸는 것을 볼수있다.
또한 **Double** 이나 **Float** 값을 정수로 초기화하는 과정을 거치면 실수를 정수로 바꾸어 계산하는것도 가능하다.

```
let integerPi = Int(pi)
```

## 타입 알리아스
- 타입 알리아스는 이미 존재하는 타입을 또다른 이름으로 정의하는것을 의미. **typealias** 라는 키워드로 타입 알리아스를 정의
- 타입 알리아스는 외부의 소스에서 온 특정한 사이즈를 가진 데이터로 작업하는 경우 처럼 이미 존재하는 타입을 문맥에 맞는 이름으로 알아보고 싶을때 유용

```
typealias AudioSample = UInt16
```
```
var maxAmplitudeFound = AudioSample.min
```
위에서 **UInt16**을 위한 **AudioSample** 알리아스를 볼수있다. 이것이 알리아스이기 때문에 **maxAmplitudeFound**를 위한 변수인 **AudioSample.min**은 실제로는 **UInt16.min**의 값인 **0**을 의미한다.

```
typealias Time = (h:Int, m:Int, s:Int)
typealias DuraTion = (start:Time, end:Time)
        
let today:DuraTion = ((20,19,34), (13,24,33))
print(today.end.h)
```
## 튜플
- 튜플은 여러 값들을 하나의 값으로 묶어준다
- 튜플안의 여러 값들은 어느 타입도 가능하고, 각각 동일한 타입일 필요도 없다.
- 선언되고 나면 상수적 성격을 띠므로 더 이상 값을 추가하거나 삭제하는 등의 변경이 불가능. 최초의 선언된 상태의 아이템만 사용할 수 있고 수정이나 삭제, 추가 등 변경할수 없는것이 특징
- 값이 바뀔 가능성을 근본적으로 제거하거나, 서로다른 타입들을 손쉽게 집단 자료형으로 구성하여 주고받을 때도 튜플의 사용성이 좋다.
- 배열, 딕셔너리, 집합은 다양한 기능을 하는 메소드를 지원하지만 튜플은 인덱스 속성이 유일, 튜플의 크기를 계산할수 있는 속성이나 데이터를 읽어올 수 있는 메소드, 심지어 순회할 수 있는 순회 특성(SequenceType)도 지원하지 않는다. 이때문에 for~in 구문을 사용할 수도 없다.
- 그 이외에는 대부분 배열이나 파운데이션 프레임워크에서 제공하는 **NSMutableArray** 와 같은 배열 객체를 이용하는 편이 효율적

```
let time1 = (9,0,48)
let time2:(h:Int, m:Int, s:Int) = (10,16,32)
        
let duration = (time1,time2)
let (start, end) = duration
let endHour = end.h
```

```
let http404Error = (404, "Not Found")
```
- (Int, String) 타입의 튜플

```
let (statusCode, statusMessage) = http404Error
println("The status code is \(statusCode)")
// prints "The ststus code is 404"
println("The status message is \(statusMessage)")
// prints "The status message is Not Found"
```

만일 튜플의 값들중 필요한 부분만 있다면, 튜플을 분리할때 튜플에서 무시할 부분을 언더바"_"로 처리하면 된다

```
let (justTheStatuscode, _) = http404Error
println("The status code is \(justTheStatusCode)")
// prints "The status code is 404"
```

0부터 시작하는 index number를 통하여 각각의 element value에 접근

```
println("The status code is \(http404Error.0)")
// prints "The status code is 404"
println("The status message is \(http404Error.1)")
// prints "The status message is Not Found"

let tupleValue = ("a", "b", 1, 2.5, true)

tupleValue.0 // "a"
tupleValue.1 // "b"
tupleValue.2 // 1
tupleValue.3 // 2.5
tupleValue.4 // true
```

튜플을 정의할때 튜플의 각 element들에 이름을 지어줄 수도 있다

```
let http2005Status = (statusCode: 200, description: "OK")
```
만일 튜플의 각 element에 이름을 지어줬다면, 각 element에 값에 접근하기 위해서 element의 이름을 사용할 수 있다

```
println("The status code is \(http200Status.statusCode)")
// prints "The status code is 200"
println("The status message is \(http200Status.description)")
// prints "The status message is OK"
```

튜플은 별도의 선언 구문이 없지만 타입 어노테이션을 사용하기 위한 타입을 정의할수는 있다

```
var tpl01 : (Int, Int) = (100, 200)
var tpl02 : (Int, String, Int) = (100, "a", 200)
var tpl03 : (Int, (String, String)) = (100, ("t", "v"))
var tpl04 : (String) = ("sample string")
```

인덱스 속성으로만 접근하려면 불편할수 있기때문에 개별 변수나 상수로 각각 할당받는 바인딩(Binding)방식의 구문도 제공

```
let tupleValue:(String, Character, Int, Float, Bool) = ("a", "b", 1, 2.5, true)
let (a,b,c,d,e) = tupleValue

// a -> "a"
// b -> "b"
// c -> 1
// d -> 2.5
// e -> true
```

함수나 메소드에서 둘 이상의 값을 반환하려면 별도의 자료형 객체를 만들거나 배열 또는 딕셔너리를 만들어 담아야 하는데, 이때 튜플을 이용하면 바로 전달 가능

```
func getTupleValue() -> (String, String, Int) {
	return ("t", "v", 100)
}
// 함수가 반환하는 튜플을 튜플 상수로 바인딩

let (a,b,c) = getTupleValue()
// a -> "t"
// b -> "v"
// c -> 100
```

## Control Flow

### 반복문

### for ~ in

- 일정 횟수만큼 특정 구문을 반복하고자 할 때에는 for ~ in 구문을 사용

```
for <루프 상수> in <순회 대상> {
    <실행할 구문>
}

for row in 1…5 {
    print(row)
}
```
순회 대상으로 사용가능한 데이터 타입

- 배열 (Array)
- 딕셔너리 (Dictionary)
- 집합 (Set)
- 범위 데이터
- 문자열 (String)


for ~ in 문을 사용한 문자열의 문자 순회

루프구문이 순회할때마다 자동으로 재선언되므로 let 키워드를 사용하여 직접 선언할 필요가 없다.

루프 상수의 생략

```
let size = 5
let padChar = “0”
var keyword = “3”

for _ in 1…size {

    keyword = padChar + keyword

}

print (“\(keyword)")
000003
```
### for ~ in 구문의 중첩

- for ~ in 구문은 필요에 따라 중첩 가능
- 흔히 다중루프라고 불린다.

```
for i in 1..<10 {
    for j in 1..<10 {
    print (“\(i) * \(j) = \(i * j)”)
    }
}
```
### while 구문

- 주어진 조건식이 false가 될때까지 실행구문을 반복 수행할때.
- 조건을 만족하는 동안은 계속 실행

	- 실행 횟수가 명확하지 않을 때
	- 직접 실행해보기 전까지는 실행 횟수를 결코 알 수 없을 때
	- 실행 횟수를 기반으로 할 수 없는 조건일 때

- while 구문의 사용 형식

```
while <조건식> {
    <실행할 구문>
}

var n = 2

while n < 1000 {
    n = n * 2
}

while true {
    // break 문을 넣어주지 않는다면 프로세스가 종료되지 않는 한 무한루프
}

◉ 무한루프는 치명적인 문제가 되곤 하지만, 터치나 클릭 둥 사용자의 액션과 이벤트에 의해 동작하는 모바일 앱은 특성상 사용자의 액션을 기다리는 동안 입력 상태를 유지하는데, 앱이 종료되지 않은 채로 대기 상태를 유지하기 위해서는 이벤트 루프라고 불리는 무한 루프를 만들어 샐행한다. 무한 루프는 이론상 영원히 반복되기 때문에 앱을 종료 시키지 않고 유지할 수 있다. 이때 무한 루프를 만들기 위해 while 구문이 사용된다.
```
- repeat ~ while 구문 ( do ~ while - Swift 2.0 변경 )

```
repeat {
    <실행할 구문>
}
while <조건식>

var n = 1024
while n < 1000 {
    n = n * 2
}

n = 1024

repeat {
    n = n * 2
}
while n < 1000

n = 2048
```
while 구문은 조건식을 먼저  평가하여 수행여부를 판단하지만, repeat ~ while 구문은 코드 블록을 일단 실행한 다음에 조건식을 평가하여 반복 여부를 결정

### 조건문

- 분기문 이라고도 불리는 조건문은 프로그램에서 하나 또는 그 이상의 조건값에 따라 특정 구문을 실행 하도록 프로그램의 흐름을 분기하는 역할

### if 구문

```
if <조건식> {
    <실행할 구문>
}

var adult = 19 
var age = 15

if age < adult {
    print(“미성년자”)
}
```
### if~else

- if는 true/false 중 어느 하나일 때에만 구문을 실행할 수 있지만, 조건식이 참일때 
A구문을, 아닐 때에는 B구문을 실행할때에 사용

```
if <조건식> {
    <조건이 참일 경우>
} else {
    <조건이 거짓일 때>
}

var adult = 19
var age = 21

if age < adult {
    print(“미성년자”)
}

if age >= adult {
    print(“성인”)
}

if age < adult {
    print(“미성년자”)
} else {
    print(“성인”)
}
```

### if 구문의 중첩

- if 조건절 안에 if 구문뿐만 아니라 else 절까지 중첩할 수 있고, else 절 내에서도 마찬가지

```
var adult = 19
var age = 21
var gender = “M”

if adult > age {
    if gender == “M” {
        print(“미성년 남자”)
    } else {
    print(“미성년 여자”)
} else {
    if gender == “M” {
        print(“성인 남자”)
    } else {
        print(“성인여자”)
    }
}
```

### if~else if

- else 자신만의 조건식을 갖는다는 특성
- if 조건절을 만족하지 못한 경우에 호출

```
if <조건> {
    <조건1이 참일 때 실행할 구문>
} else if <조건2> {
} else {
    <앞의 조건들을 전부 만족하지 않았을 때 실행할 구문>
}
```
### guard 구문
- if 구문과의 차이점은 else 블록이 필수이지만, 표현식의 결과가 참일 때 실행되는 블록이 없다는 점

```
guard <조건식 또는 표현식> else {
    <조건식 또는 표현식의 결과가 false일 때 실행될 코드>
}
```
