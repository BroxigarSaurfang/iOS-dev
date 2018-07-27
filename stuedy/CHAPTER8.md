# 구조체와 클래스

* 클래스 내부에 정의된 변수 또는 상수를 프로퍼티(Properties), 속성 변수 또는 상수
* 클래스 내부에 정의된 함수를 메소드(Method)
* 프로퍼티나 매소드를 합해서 구조체나 클래스의 멤버(Member)라고 표현

### 구조체와 클래스의 공통점

* 프로퍼티 - 변수나 상수를 사용하여 값을 저장하는 프로퍼티를 정의할 수 있다
* 메소드 - 함수를 사용하여 기능을 제공하는 메소드를 정의할 수 있다
* 서브스크립트 - 속성값에 접근할 수 있는 방법을 제공하는 서브스크립트를 정의할 수 있다
* 초기화 블록 - 객체를 원하는 초기 상태로 설정해주는 초기화 블록을 정의할 수 있다
* 확장 - 객체에 함수적 기능을 추가하는 확장(extends) 구문을 사용할 수 있다
* 프로토콜 - 특정 형식의 함수적 표준을 제공하기 위한 프로토콜을 구현할 수 있다


### 구조체와 클래스의 차이점

클래스가 구조체보다 더 기능 범위가 크기 때문에 구조체는 할수 없지만 클래스는 할 수 있는 기능들이 다음과 같이 있다

* 상속 - 클래스의 특성을 다른 클래스에게 물려줄 수 있다
* 타입 캐스팅 - 실행 시 컴파일러가 클래스 인스턴스의 타입을 미리 파악하고 검사할 수 있다
* 소멸화 구문 - 인스턴스가 소멸되기 직전에 처리해야 할 구문을 미리 등록해 놓을 수 있다
* 참조에 의한 전달 - 클래스 인스턴스가 전달될 때에는 참조 형식으로 제공되며, 이때 참조가 가능한 개수는 제약이 없다

## 구조체와 클래스의 기본 개념

* 구조체와 클래스 이름의 첫 글자는 대문자로, 나머지 글자는 소문자로 작성 (카멜(Camel)표기법)
* 2개 이상의 복합 단어는 단어별로 끊어 첫 글자는 대문자로, 나머지는 소문자로 작성
* 이미 축약된 약어는 모두 대문자로 작성 가능. ex) JSON, NS, HTTP 등
* 프로퍼티나 메소드를 선언할 때는 소문자로 시작
* 언더바로 단어를 연결하는 방식은 지양

### 메소드와 프로퍼티

```
struct Resolution {
	var width = 0
	var height = 0
	
	func desc() -> String {
		return "Resolution 구조체"
	}
}

class VideoMode {
	var interlaced = false
	var frameRate = 0.0
	var name : String?
	
	func desc() -> String {
		return "VideoMode 클래스"
	}
}
```

### 인스턴스

* 단순히 정의된 객체는 메모리 공간을 할당받은 객체가 필요
* 구조체나 클래스를 정의하여 실직적인 값을 담을수 있는 것이 인스턴스

```
인스턴스 생성구문 : 객체가 초기화 되면서 인스턴스가 생성되고, 이 값을 변수나 상수에 할당하면 원하는 곳에서 사용 가능

// Ressolution 구조체에 대한 인스턴스를 생성하고 상수 insRes에 할당
let insRes = Resolution()

// VideoMode 클래스에 대한 인스턴스를 생성하고 상수 insVMode에 할당
let insVMode = VideoMode()
```

* 함수의 이름 다음에 오면 함수 호출 연산자 역할을하고, 클래스나 구조체 이름 다음에 오면 클래스나 구조체를 초기화 하여 인스턴스를 생성하는 인스턴스 생성 연산자가 된다

* 프로퍼티에 접근하려면 반드시 인스턴스를 먼저 생성
* 프로퍼티에 접근할 때는 점 문법(Dot Syntax)을 이용하여 인스턴스의 하위 객체에 접근

```
let width = insRes.width
print("insRes 인스턴스의 width 값은 \(width)입니다")
```

* insRes.width 프로퍼티는 구조체 내에서 대입된 값으로 초기화 되며, 이후 값을 수정하지 않았으므로 출력 결과는 0
* insRes.width 대신 Resolution.width로 접근하면 해당 프로퍼티를 찾을수 없다는 오류 발생

* 객체에 정의된 프로퍼티가 서브 프로퍼티를 가지고 있는 객체라면 다음과 같이 계속 점 구문을 이용하여 단계적으로 접근

```
class videoMode {
	var interlaced = false
	var frameRate = 0.0
	var name : String?

	var res = Resolution()

	...(중략)...
	
}

// VideoMode 클래스에 대한 인스턴스를 생성하고 상수에 할당
let vMode = videoMode()

print("vMode 인스턴스의 width 값은 \(vMode.res.width)입니다")

```

* 점 구문은 프로퍼티에 값을 대입할 때에도 사용

```
vMode.name = "Sample"
vMode.res.width = 1280

print("\(vMode.name!) 인스턴스의 width 값은 \(vMode.res.width)입니다")

```

* 체인(Chain) : 점 구문을 사용하여 프로퍼티의 하위 프로퍼티까지 직접 참조할 수 있는 것과 마찬가지로, 프로퍼티의 하위 프로퍼티에 값을 할당할 때도 위와 같이 점 구문을 연속으로 연결하여 값을 할당할 수 있는 방법

* 체인 방식의 연속된 접근이 지원되지 않는다면 단계적인 할당 과정을 거쳐서 하위 프로퍼티에 접근

```
var res = vMode.res
res.width = 1280
```
