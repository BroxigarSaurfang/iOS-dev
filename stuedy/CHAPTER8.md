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

#### 초기화

* 스위프트에서 옵셔널 타입으로 선언되지 않은 모든 프로퍼티는 명시적으로 초기화 해주어야 한다.
* 구조체나 클래스 이름 뒤에 빈 괄호를 붙이거나 인자값을 넣어주는 방법
* 클래스나 구조체의 모든 프로퍼티는 적어도 인스턴스가 생성되는 시점까지는 반드시 초기화되어야 한다.
* 선언과 동시에 초기값을 지정하는것이 좋지만, 그럴수 없다면 인스턴스 과정, 즉 초기화 메소드 내에서 초기값을 입력 받아야 한다.
* 명시적으로 초기화 하는 방법
	- 프로퍼티를 선언하면서 동시에 초기값을 지정하는 경우
	- 초기화 메소드 내에서 프로퍼티의 초기값을 지정하는 경우
	- 두가지 이외는 옵셔널 타입으로 선언

#### 구조체 초기화

* 구조체는 모든 프로퍼티의 값을 인자값으로 입력받아 초기화하는 기본 초기화 구문을 자동으로 제공
* 프로퍼티를 보통 멤버 변수라고 부르는 까닭에, 이 초기화 구문을 멤버와이즈 초기화 구문(Memberwise Initalizer)라고 부르기도 한다.

```
struct Resolution {
	var width = 0
	var height = 0
}

let defaultRes = Resolution(width: 1024, height: 768)
print("width:\(defaultRes.width), height:\(defaultRes.height)")
width: 1024, heigth: 768

```
* 프로퍼티의 초기 설정값은 0이었지만 각각 1024, 768로 바뀐게 아닌 초기화되었다.
* 입력한 값이 프로퍼티의 초기값으로 설정된 결과

```
Resolution() // 기본 초기화 구문. 내부적으로 프로퍼티를 초기화하지 않음. 선언과 동시에 객체의 모든 프로퍼티는 초기값이 지정되어 있어야 한다.

```

#### 클래스 초기화

* 클래스에서 제공되는 것은 빈 괄호 형태의 기본 초기화 구문
* 모든 프로퍼티가 선언과 동시에 초기화 되어 있을 때에만 사용할 수 있다.
* 만약 초기화 되지 않은 프로퍼티가 있다면 기본 초기화 구문은 사용 불가, 이 때에는 직접 초기화 구문을 정의해서 내부에서 프로퍼티를 초기화해 주어야 한다.
	- 모든 프로퍼티는 정의할 때 초기값을 지정 또는 옵셔널 타입으로 선언
	- 인스턴스를 생성할 때에는 클래스명 뒤에 ()를 붙여준다.


#### 구조체의 값 전달 방식 : 복사에 의한 전달

* 구조체는 인스턴스를 생성한 후 이를 변수나 상수에 할당하거나 함수의 인자값으로 전달할 때 값을 복사하여 전달하는 방식을 사용
* 값 타입, 또는 복사에 의한 전달 이라고 한다.
* 스위프트에서 제공하는 정수, 문자열, 배열 또는 딕셔너리 등 모두 자료형이 구조체로 구현되었기 때문에 복사를 통해 값이 전달
* 모든 구조체 인스턴스들이 상수나 변수에 할당될 때 복사된다는 뜻

```
let hd = Resolution(width: 1920, heigth: 1080)
var cinema = hd

cinema.width = 2048
print(hd.width) // = 1920 - 값이 복사되었기 때문에 변하지 않음
```

#### 클래스의 값 전달 방식 : 참조에 의한 전달

* 메모리 주소 참조에 의한 전달 방식(Reference Type)
* 참조 타입은 변수나 상수에 할당될 때, 또는 함수의 인자값으로 전달되 때 값의 복사가 이루어지지 않는 대신 현재 존재하는 인스턴스에 대한 참조가 전달(인스턴스가 저장된 메모리 주소 정보가 전달된다는 뜻)
* 클래스 타입일 경우 항상 메모리 주소를 사용하여 객체 자체를 전달

```
let video = VideoMode()
video.name = "Original Video Instance"

print("video 인스턴스의 name 값은 \(video.name!)입니다.")
// video 인스턴스의 name 값은 Original Video Instance입니다.

let dvd = video
dvd.name = "DVD Video Instance"

func changeName(v: VideoMode) {
	v.name = "Function Video Instance"
}

changeName(v: video)
print("video 인스턴스 name 값은 \(video.name!)입니다.")
// video 인스턴스의 name 값은 Function Video Instance입니다.

```

// 클래스 인스턴스에서 단순한 값 비교는 불가능, 대신 두 대상이 값은 메모리 공간을 참조하는 인스턴스인지 비교가능

```
* 동일 인스턴스인지 비교할때 : ===
* 동일 인스턴스가 아닌지 비교할때 : !===

if (video === dvd) {
	print("video와 dvd는 동일한 VideoMode 인스턴스를 참조")
} else {
	print("video와 dvd는 서로 다른 VideoMode 인스턴스를 참조")
}
// video와 dvd는 동일한 VideoMode 인스턴스를 참조

let vs = VideoMode()
let ds = VideoMode()

if (vs === ds) {
	print("vs와 ds는 동일한 VideoMode 인스턴스를 참조")
} else {
	print("vs와 ds는 서로 다른 VideoMode 인스턴스를 참조")
}
// vs와 ds는 서로 다른 VideoMode 인스턴스를 참조
- 동일한 타입의 인스턴스 이지만 같은 메모리 주소를 참조하는것은 아니다
```

구조체를 사용하는것이 좋은 예

1. 서로 연관된 몇 개의 기본 데이터 타입들을 갭슐화하여 묶는 것이 목적일 때
2. 캡슐화된 데이터에 상속이 필요하지 않을 때
3. 캡슐화된 데이터를 전달하거나 할당하는 과정에서 참조 방식 보다는 값이 복사되는 것이 합리적일 때
4. 캡슐화된 원본 데이터를 보존해야 할 때

### 프로퍼티 ( Property )

* 저장 프로퍼티
	- 입력된 값을 저장하거나 저장된 값을 제공하는 역할
	- 상수 및 변수를 사용해서 정의 가능
	- 클래스와 구조체에서는 사용이 가능하지만, 열거형에서는 사용할 수 없음

* 연산 프로퍼티
	- 특정 연산을 통해 값을 만들어 제공하는 역할
	- 변수만 사용해서 정의 가능
	- 클래스, 구조체, 열거형 모두에서 사용 가능


* 프로퍼티를 사용하려면 인스턴스가 필요
* 인스턴스를 생성한 다음 이 인스턴스를 통해서 프로퍼티를 참조하거나 값을 할당
* 인스턴스에 소속되는 프로퍼티를 인스턴스 프로퍼티라고 한다
* 예외적으로 일부 프로퍼티는 클래스와 구조체 자체에 소속되어 값을 가지기도 하는데 이런 프로퍼티들을 타입 프로퍼티라고 한다. 타입 프로퍼티는 인스턴스를 생성하지 않아도 사용 가능

```
역할에 따른 분류 [ 저장프로퍼티, 연산 프로퍼티]
소속에 따른 분류 [ 인스턴스 프로퍼티, 타입 프로퍼티]
```

#### 저장 프로퍼티

프로퍼티 선언

```
class User {
	var name: string
}

// 초기화 구문을 작성하고, 그 안에서 초기값을 할당해 주는 방법

class User {
	var name: string
	
	init() {
		self.name = ""
	}
}



// 옵셔털 타입으로 지정하는 방법

class User {
	var name: string?
	
	or
	
	var name: string!
}



// 프로퍼티에 초기값을 할당해 주는 방법
class User {
	var name: string =. "
}

```


#### 저장 프로퍼티의 분류

* var 키워드로 정의되는 변수형 저장 프로퍼티( 멤버 변수 )
* let 키워드로 정의되는 상수형 저장 프로퍼티( 멤버 상수 )
* 변수나 상수의 성격을 그대로 물려받아, 값의 수정 여부에 영향을 줌

```
구조체에서 저장 프로퍼티

// 고정 길이 범위 구조체
struct FixedLengthRange {
	var startValue: Int  // 시작값
	let length: Int. // 값의 범위
}


// 가변 길이 범위 구조체
struct FlexibleLengthRange {
	let startValue: Int  // 시작값
	var length: Int. // 값의 범위
}


// 아래 구조체 인스턴스는 정수값 0,1,2를 의미
var rangeOfFixedIntegers = FixedLengthRange(startValue: 0, length: 3)

// 아래처럼 시작값을 변경하면 객체 인스턴스는 정수값 4,5,6을 의미
rangeOfFixedIntegers.startValue = 4

// 아래 구조체 인스턴스는 정수값 0,1,2를 의미
var rangeOfFlexibleIntegers = FlexibelLengthRange(starValue:0 length: 3)

// 아래처럼 범위값을 변경하면 객체 인스턴스는 정수값 0,1,2,3,4를 의미
rangeOfFlexibleIntegers.length = 5


// 상수에 할당된 구조체 인스턴스는 변경불가
반면 클래스 인스턴스를 상수에 할당하더라도 클래스 내에서 변수로 선언한 저장 프로퍼티는 얼마든지 값을 수정 가능
구조체는 값에 의한 전달 방식으로 인스턴스가 변수나 상수에 할당되고, 클래스는 참조에 의한 전달 방식으로 인스턴스의 레퍼런스가 변수나 상수에 할당되기 때문
따라서 구조체는 저장 프로퍼티의 값이 바뀌면 상수에 할당된 인스턴스 전체가 변경되고, 클래스는 저장 프로퍼티의 값이 바뀌더라도 상수에 할당된 인스턴스의 레퍼런스는 변경되지 않는다
```

#### 지연 저장 프로퍼티 ( Stored Property )

* 클래스 인스턴스가 생성되어 모든 저장 프로퍼티가 만들어 지더라도 lazy 키워드가 붙은 프로퍼티는 선언만 될 뿐 초기화 되지 않고 계속 대기하고 있다가 프로퍼티가 호출되는 순간 초기화
* 만약 클래스나 구조체 인스턴스가 대입된다면, 프로퍼티가 호출되기 전까지는 해당 인스턴스는 초기화되지 않는다.
* 실제로 호출되는 시점에서 초기화

```
class OnCreate {
	init() {
		print("OnCreate!!")
	}
}

class LazyTest {
	var base = 0
	lazy var late = OnCreate()
	
	init() {
		print("Lazy Test")
	}
}

let lz = lazyTest()
// "Lazy Test"

lz.late
// "OnCreate!!"

두번째 호출부터는 처음 초기화된 값을 그대로 사용할 뿐 다시 초기화 되지는 않는다
```

#### 클로저를 이용한 저장 프로퍼티 초기화

* 연산이나 로직 처리를 통해 얻어진 값을 이용하여 초기화해야 하는 경우 클로저를 사용하여 필요한 로직을 실행한 다음, 반환되는 값을 이용하여 저장 프로퍼티를 초기화할 수 있다.
* 로직을 통해 값을 구한다는 점에서 연산 프로퍼티와 유사하지만 참조될 때마다 매번 값이 재평가 되는 연산 프로퍼티와 달리 최초 한번만 값이 평가된다는 차이를 가진다

```
let/var 프로퍼티명: 타입 = {
	정의 내용
	return
}()

// 정의된 클로저 구문은 클래스나 구조체의 인스턴스가 구조체의 인스턴스가 생성될 때 함께 실행되어 초기값을 반환하고, 이후로는 해당 인스턴스 내에서 재실행 되지 않는다.
저장 프로퍼티의 값 역시 몇 번을 다시 참조하더라도 재평가 되지 않는다
```

```
class PropertyInit {

	// 저장 프로퍼티 - 인스턴스 생성 시 최초 한 번만 실행
	var value01: String! = {
		print("value01 execute")
		return "value01"
	}()
	
	// 저장 프로퍼티 - 인스턴스 생성 시 최초 한 번만 실행
	let value02: String! = {
		print("value02 execute")
		return "value02"
	}()
}

let s = PropertyInit()
// value01 execute
// value02 execute
저장 프로퍼티의 값이 평가되는 시점이 인스턴스를 생성하는 인스턴스를 생성하는 시점이기 때문

s.value01
s.value02

// 실행 결과 없음
저장 프로퍼티에 정의된 클로저 구문이 더 이상 재실행되지 않기 때문
```

```
// 클로저 구문을 실행하여 결과값을 저장 프로퍼티에 대입하고 싶지만, 처음부터 클로저를 실행하는 저장 프로퍼티의 특성이 부담스러울 경우

lazy var 프로퍼티명: 타입 =. 
	정의 내용
	return 반환값
}()

lazy var value03: String! = {
	print("value03 execute")
	return "value03"
}()

let s1 = PropertyInit()

// value01 execute
// value02 execute

s1.value03

// value03 execute
```

#### 연산 프로퍼티 ( computed property)

* 실제 값을 저장햇다가 반환하지는 않고 대신 다른 프로퍼티의 값을 연산 처리하여 간접적으로 제공
* 프로퍼티의 값을 참조하기 위해 내부적으로 사용하는 구문이 get 구문, 함수와 비슷해서 내부적으로 return 키워드를 사용하여 값을 반환하는데, 여기서 반환되는 값이 프로퍼티가 제공하는 값이된다.
* 선택적으로 set 구문을 추가가능, 이는 연산 프로퍼티에 값을 할당하거나 변경하고자 할 때 실행되는 구문
* set 구문은 선택적이라는 조건이 붙은만큼 생략 가능하지만, 생략시 외부에서 연산 프로퍼티에 값을 할당할 수 없으며, 내부적인 연산 처리를 통해 값을 제공받는 읽기 전용프로퍼티가 생성
* get 구문은 필수요소, 값을 반환하는 기능 자체를 갖지 못하기 때문에 생략 불가
* 연산 프로퍼티는 항상 클래스나 구조체 또는 열거형 내부에서만 사용 가능

```
class/struct/enum 객체명 {
	...
	var 프로퍼티명 : 타입 {
		get {
		필요한 연산 과정
		return 반환값
		}
		set(매개변수명) {
		필요한 연산구문
		}
	}
}

// 연산 프로퍼티는 다른 프로퍼티에 의존적이거나, 혹은 특정 연산을 통해 얻을 수 있는
 값을 정의 할 때 사용
 
```

```
import Foundation

struct UserInfo {
	// 저장프로퍼티 : 태어난 년도
	
	var birth :  Int!
	
	// 연산 프로퍼티 : 올해가 몇년도인지 계산
	
	var thisYear : Int! {
		get {
			let df = DateFomatter()
			df.dataFomatter = "yyyy"
			return Int(df.string(from: Date()))
		}
	}	
	
	// 연산 프로퍼티 : 올해 - 태어난 연도 + 1
	
	var age : Int {
		get {
			return (self.thisYear - self.brith) + 1
		}
	}
}

let info = UserInfo(birth: 1980)
print(info.age)
// 37
		
```

```
struct Rect {
	// 사각형이 위치한 기준 좌표(좌측 상단 기준)
	var originX : Double = 0.0, originY : Double = 0.0
	
	// 가로 세로 길이
	var sizeWidth : Double = 0.0, sizeHeight : Double = 0.0
	
	// 사각형의 X 좌표 중심
	var centerX : Double {
		get {
			return self.originX + (sizeWidth / 2)
		}
		set(newCenterX) {
			originX = newCenterX - (sizeWidth / 2)
		}
	}
	
	// 사각형의 Y 좌표 중심
	var centerY : Double {
		get {
			return self.originY + (self.sizeHeight / 2)
		}
		set(newCenterY) {
			self.originY = newCenterY - (self.sizeHeight / 2)
		}
	}
}

var square = Rect(originX: 0.0, originY: 0.0, sizeWidth: 10.0, sizeHeight: 10.0)
print("square.centerX = \(square.centerX), square.centerY =(square.centerY)")
// square.centerX = 5.0, square.centerY = 5.0
```

```
struct Position {
	var x : Double = 0.0
	var y : Double = 0.0
}

struct Size {
	var x : Double = 0.0
	var y : Double = 0.0
}

struct Rect {
	// 사각형이 위치한 기준 좌표 (좌표 상단 기준)
	var origin = Position()
	
	// 가로 세로 길이
	var size = Size()
	
	// 사각형 X 좌표 중심
	var center : Position {
		get {
			let centerX = self.origin.x + (self.size.width / 2)
			let centerY = self.origin.y + (self.size.height / 2)
			return Position(x:centerX, y:centerY)
		}
		set(newCenter) {
			self.origin.x = newCenter.x - (size.width / 2)
			self.origin.y = newCenter.y - (size.height / 2)
		}
	}
}

let p = Position(x:0.0, y:0.0)
let s = Size(width:10.0, height:10.0)

var square = Rect(origin:p, size:s)
print("square.centerX = \(square.center.X), square.centerY = \(square.center.y)")

// square.centerX = 5.0, square.centerY = 5.0



// 연산 프로퍼티에 값을 할당하면 여기에 정의된 구문이 실행
프로퍼티에 할당된 값은 set 다음에 오는 괄호의 인자값으로 전달되는데, 이때 인자값의 참조를 위해 매개변수가 사용
예제에서는 newCenter가 매개변수, 매개변수명이 생략 된다면 newValue라느 기본 인자명이 사용
매개변수 타입은 연산프로퍼티의 타입으로 정해져 있기 때문에 생략가능


square.center = Position(x: 20.0, y: 20.0)
print("square.x = \(square.origin.x), square.y = \(square.y)")

// square.x = 15.0, square.y = 15.0
```

* 아이템을 추가하거나 빈 공백이나 nil을 포함해서 임의로 수정할 수 없도록 제약을 가하는 읽기만 가능하고 쓰기는 불가능한 프로퍼티를  read-only 프로퍼티 또는 get-only 프로퍼티라고 한다.

```
// 연산 프로퍼티는 메소드 형식으로 표현 가능
연산 프로퍼티의 get 구문이 get 메소드, set 구문이 set 메소드로 대체

struct Rect {

...(중략)...

	func getCenter() -> Position {
		let centerX = self.origin.x + (self.size.width / 2)
		let centerY = self.origin.y + (self.size.height / 2)
		return Position(x: centerX, centerY)
	}
	
	// mutating 키워드는 구조체는 메소드 내에서 프로퍼티를 수정할 수 없는 제약이 있는데, 이 제약을 풀고 메소드 내에서 멤버 변수를 수정하기 위해 사용
	mutating func setCenter(newCenter: Position) {
		self.origin.x = newCenter.x - (size.width / 2)
		self.origin.y = newCenter.y - (size.height / 2)
	}
}

```


#### 프로퍼티 옵저버 ( Property Observer )

* 특정 프로퍼티를 계속 관찰하고 있다가 프로퍼티의 값이 변경되면 반응
* 프로퍼티의 값을 직접 변경하거나 시스템에 의해 자동으로 변경하는 경우에 상관없이 프로퍼티의 값이 설정되면 무조건 호출
* 현재와 동일한 값이 재할당 되더라도 호출
* 저장 프로퍼티에 값을 대입하는 구문이 수행되거나 연산 프로퍼티에서 set 구문이 실행되는 모든 경우에 옵저버가 호출
	- willSet 프로퍼티의 값이 변경되기 직전에 호출되는 옵저버
	- didSet 프로퍼티의 값이 변경되는 직후에 호출되는 옵저버

```
var <프로퍼티명> : <타입> [ = <초기화> ] {
	willSet [ (<인자명>) ] {
		<프로퍼티 값이 변경되기 전에 실행할 내용>
	}
}

// willSet 옵저버를 구현해 둔 프로퍼티에 값을 대입하면 그 값이 프로퍼티에 대입되기 직전에 willSet 옵저버 실행
단, 전달된 값은 참조할 수는 있지만, 상수 형태로 전달하는 값이기 때문에 수정할 수는 없다
willSet 구현 블록 내에서 사용할 이름을 부여할 수 있는데 이는 선택사항
이름을 부여하지 않을 때에는 매개상수 이름과 괄호를 모두 생략해주면 된다
생략시 기본 상수명인 newValue라는 이름으로 전달
```

```
var <프로퍼티명> : <타입> [ = <초기값> ] {
	didSet [ (<인자명>) ] {
		<프로퍼티 값이 변경된 후에 실행할 내용>
	}
}

// 프로퍼티에 값이 할당된 직후에 호출
새로 할당된 값이 아닌 기존에 저장되어 있던 값이 매개상수 형태로 전달
생략시 oldValue

* 새로 할당된 값이 필요할때
* didSet 옵저버가 호출되는 시점은 이미 프로퍼티에 새로운 값이 대입된 후 이기때문에 새로운 값은 이미 프로퍼티에 저장되어 있는 상태, 프로퍼티 자체를 참조하면 된다
```

```
struct Job {
	var income: Int = 0 {
		willSet(newIncome) {
			print("이번 달 월급은 \(newIncome)원입니다.")
		}
		didSet {
			if income > oldValue {
				print("월급이 \(income - oldValue) 원 증가하셨네요. 소득세가 상향조정될 예정입니다")
				} else {
					print("저런, 월급이 삭감되셨군요. 그래도 소득세는 깍아드리지 않아요. 알죠?")
				}
		}
	}
}
```


#### 타입프로퍼티 ( Type Property )

* 클래스 또는 구조체 인스턴스를 생성한 후 이 인스턴스를 통해서만 참조할 수 있는 저장, 연산 프로퍼티는 인스턴스에 관련된 값을 저장하고 다루므로 인스턴스 프로퍼티
* 타입 프로퍼티는 클래스나 구조체의 인스턴스에 속하는 값이 아니라 클래스나 구조체 자체에 속하는 값이므로 인스턴스를 생성하지 않고 클래스나 구조체 자체에 저장, 저장된 값은 모든 인스턴스가 공통으로 사용가능
* 인스턴스 프로퍼티는 개별 인스턴스마다 다른 값을 저장할 수 있어서 하나의 인스턴스에서 변경한 프로퍼티의 값은 그 인스턴스 내에서만 유지 나머지 인스턴스에 영향없음
* 타입 프로퍼티는 인스턴스가 아무리 많더라도 모든 인스턴스가 하나의 값을 공용으로 사용
* 복사된 값이 아니라 실제로 하나의 값이므로 하나의 인스턴스에서 타입 프로퍼티의 값을 변경시 나머지 인스턴스들이 변경된 값을 일괄 적용받는다
* 클래스나 구조체, 열거형 객체 내에서 선언하는 것이므로 선언된 객체 내에서만 접근 가능한 범위를 가진다

```
static let/var 프로퍼티명 = 초기값

or 

class let/var 프로퍼티명 : 타입 {
	get {
		return 반환값
	}
	set {
	}
}

// 타입 프로퍼티로 사용할 프로퍼티 앞에 static 키웜드만 추가해주면 된다
static 키워드는 구조체나 클래스에 관계없이 저장, 연산 프로퍼티에 모두 사용 가능
class 키워드는 클래스에서 연산 프로퍼티에만 붙일 수 있는 키워드
class 키워드르 사용하여 타입 프로퍼티를 선언하면 상속받은 하위 클래스에서 재정의(Override)할 수 있는 타입 프로퍼티가 된다
```

```
// 변수나 상수 어느 것이든 타입 프로퍼티로 사용할 수 있지만, 이를 이용하여 정의한 저장 프로퍼티를 타입 프로퍼티로 선언할 때는 초기값을 반드시 할당해야 한다.

struct Foo {
	// 타입 저장 프로퍼티
	static var sFoo = "구조체 타입 프로퍼티값"
	
	// 타입 연산 프로퍼티
	static var cFoo : Int {
		return 1
	}
}

class Boo {
	// 타입 저장 프로퍼티
	static var sFoo = "클래스 타입 프로퍼티값"
	
	// 타입 연산 프로퍼티
	static var cFoo : Int {
		return 10
	}
	
	// 재정의가 가능한 타입 연산 프로퍼티
	class var oFoo : Int {
		return 100
	}
}

// class 키워드를 사용하여 정의한 oFoo는 Boo 클래스를 상속받는 하위 클래스에서 재정의할 수 있는 타입 프로퍼티라는 점이 cFoo와 차이점

print(Foo.sFoo)
// "구조체 타입 프로퍼티값"

Foo.sFoo = "새로운 값"
print(Foo.sFoo)
// "새로운 값"

print(Boo.sFoo)
// "클래스 타입 프로퍼티 값"

print(Boo.cFoo)
//10

// 타입 프로퍼티는 인스턴스에 속하지 않는 값이므로 만약 인스턴스를 생성한 다음 점 구문을 이용하여 타입 프로퍼티를 읽으려고 하면 선언되지 않은 프로퍼티라는 오류가 발생.
타입 프로퍼티는 반드시 클래스나 구조체, 또는 열거형 자체와 함께 사용 해야 한다

```


### 메소드 ( Method )

* 클래스나 구조체, 열거형과 같은 객체 내에서 함수가 선언 될 경우 이를 메소드라고 통칭
* 특정 타입의 객체 내부에서 사용하는 함수
* 함수는 독립적인 기능을 구현하기 위해 만들어지는 것
* 메소드는 하나의 객체 내에 정의도니 다른 메소드들과 서로 협력하여 함수적인 기능을 수행

* 인스턴스 메소드 ( Instance Method ) - 객체의 인스턴스를 생성해야 사용할 수 있는 메소드, 주어진 객체의 인스턴스와 함께 특수한 임무나 함수적인 기능을 수행하도록 갭슐화된 메소드
* 타입 메소드 ( Type Method ) - 객체 인스턴스를 생성하지 않아도 사용할 수 있는 메소드, 객체 타입 자체에 관련된 메소드


#### 인스턴스 메소드 ( Instance Method )

* 클래스, 구조체 또는 열거형과 같은 객체 타입이 만들어내는 인스턴스에 소속된 함수
* 인스턴스 프로퍼티에 접근하거나 수정하는 방법을 제공하거나 인스턴스의 생성 목적에 따른 함수적 관계성을 제공하는 등 객체의 인스턴스에 대한 기능적 측면을 제공
* 인스턴스 메소드는 객체 타입 내부에 선언된다는 점을 제외 하고는 일반 함수와 선언하는 형식이 완전히 동일
* 인스턴스 메소드는 같은 객체 내에서 정의되는 같은 인스턴스 메소드나 인스턴스 프로퍼티에 접근할 수 있도록 권한이 부여되며, 해당 메소드가 속한 인스턴스를 통해서만 호출될 수 있다.

```
struct Resolution {
	var width = 0
	var height = 0
	
	
	// 구조체의 요약된 설명을 리턴해주는 인스턴스 메소드
	func desc() -> String {
		let desc = "이 해상도는 가로 \(slef.width) X \(self.height) 로 구성됩니다."
	}
}

class VideoMode {
	var resolution = Resolution()
	var interlaced = false
	var frameRate = 0.0
	var name : String?
	
	// 클래스의 요약된 설명을 리턴해주는 인스턴스 메소드
	func desc() -> String {
		if self.name != nil {
			let desc = "이 \(self.name!) 비디오 모드는 \(self.frameRate)의 프레임 비율로 표시됩니다."
		} else {
			let desc = "이 비디오 모드는 \(self.frameRate)의 프레임 비율로 표시됩니다."
			return desc
		}
	}
}

// 클래스의 멥버인 메소드이자 인스턴스 메소드인 desc()는 일반 함수와 다음과 차이점이 있다.
1. 구조체와 클래스의 인스턴스에 소속된다는 점
2. 메소드 내에서 정의된 변수와 상수뿐만 아니라 클래스 범위에서 정의된 프로퍼티도 모두 참조할 수 있다는 점
3. self 키워드를 사용할 수 있다는 점

```

```
self.프로퍼티명

// self.키워드는 클래스나 구조체 자신을 가리킨다.
정확히는 클래스나 구조체의 인스턴스의 자신을 가리킨다 라고 할 수있다.
self 키워드와 프로퍼티 이름을 구분해주는 점(.)은 일종의 소속 연산자로서 '~의'라는 소속의 의미를 나타낸다.
self 키워드 뒤에 오는 프로퍼티명은 클래스나 구조체의 멤버로 선언된 프로퍼티 라는 뜻


var res = Resolution()
res.width

원래대로라면 width는 인스턴스 프로퍼티이므로 다음과 같이 인스턴스를 통해서만 값에 접근
하지만 인스턴스는 클래스 외부에서 접근할 수 있을 뿐, 클래스 내부에서는 어느 인스턴스에 할당된 것인지에 대한 정보를 정확히 알 수가 없기 때문에 self 키워드를 사용
하지만 메소드 내부에 동일한 이름을 가진 변수나 상수가 선언되어있지 않을 경우 생략 가능하다
self 가 붙은 변수는 프로퍼티로, 붙지않은 변수는 일반 변수로 판단

struct Resolution {
	var width = 0
	var heigth = 0
	
	func judge() -> Bool {
		let width = 30
		return self.width == width
	} // false
} 

```

```
class Counter {
	
	// 카운트를 저장할 프로퍼티
	var count = 0
	
	// 카운트를 1 증가
	func increment() {
		self.count += 1
	}
	
	//입력된 값만큼 카운트를 증가
	func incrementBy(amount:Int) {
		self.count += amount
	}
	
	// 카운트를 0으로 초기화
	func reset() {
		self.count = 0
	}
}


// Counter 클래스의 인스턴스를 생성. 초기 카운터 값은 0
let counter = Counter()

// 카운터 값을 증가. 이제 카운터 값은 1
counter.increment()

// 카운터 값을 5만큼 증가. 이제 카운터 값은 6
counter.incrementBy(amount: 5)

// 카운터 값을 초기화. 이제 카운터 값은 0
counter.reset()

```

```
struct Point {
	var x = 0.0, y = 0.0
	mutating func moveByX(x deltaX: Double, y: deltaY: Double) {
		self.x += deltaX
		self.y += deltaY
	}
}

var point = Point(x: 10.5, y: 12.0)
point.moveByX(x: 3.0, y: 4.5)
print("이제 새로운 좌표는 (\(point.x), \(point.y))입니다")

// 이제 새로운 좌표는 (13.5, 16.5)입니다

class Location {
	var x = 0.0, y = 0.0
	func moveByX(x deltaX: Double, y: deltaY: Double) {
		self.x += deltaX
		self.y += deltaY
	}
}

var loc = Location()
loc.x = 10.5
loc.y = 12.0
loc,moveByX(x: 3.0, y: 4.5)
print("이제 새로운 좌표는 (\(loc.x), \(loc.y))입니다")

// 이제 새로운 좌표는 (13.5, 16.5)입니다

// 구조체나 열거형의 인스턴스 메소드 내부에서 프로퍼티의 값을 수정할 때는 반드시 mutating 키워드를 추가해야 한다.
구조체나 열거형 인스턴스를 상수로 할당받으면 mutating 메소드를 호출할 수 없다
클래스 인스턴스 메소드에서는 프로퍼티를 인스턴스 내의 프로퍼티를 원하는 대로 수정 가능
```

### 타입 메소드 ( Type Method )

* 객체 타입 자체에서 호출
* 인스턴스를 생성하지 않고 클래스나 구조체 자체에서 호출할 수 있는 메소드
* 구조체나 열거형, 클래스 모두 타입 메소드를 선언할 때는 static 키워드를 사용
* 하위 클래스에서 재정의 가능한 타입 메소드를 선언할 때는 class 키워드를 사용
* static, class 키워드는 클래스 타입에서만 사용 가능
* 선언된 타입 메소드를 호출할 때는 점 구문 이용

```
class Foo {
	// 타입 메소드 선언
	class func fooTypeMethod() {
		// 타입 메소드의 구현 내용이 여기에 들어간다
	}
}

let f = Foo()
f.fooTypeMethod() // 오류
Foo.fooTypeMethod()
```

* 인스턴스 메소드는 메소드의 동작 범위가 인스턴스 내부로 제한되기 때문에 두 개의 인스턴스를 생성하여 메소드를 실행하면 메소드에 의해 값이 변하더라도 해당 인스턴스에만 국한되어 값이 변하고 나머지 인스턴스에는 영향을 미치지 않는다. 그러나 타입 메소드는 객체 타입 전체에 영향을 준다.
* 타입 메소드 자체에 인스턴스가 존재하지 않기 때문에 타입 메소드에서는 인스턴스 프로퍼티를 참조할 수 없다.
* 타입 메소드에서 사용할수 있는 프로퍼티는 오직 타입 프로퍼티


### 상속 ( Inheritance )

* 한 클래스가 다른 클래스에서 정의된 프로퍼티나 메소드를 물려받아 사용하는 것
* 상속을 사용하면 이미 만들어진 다른 클래스의 기능이나 프로퍼티를 직접 구현하지 않고도 사용 가능
* 추가로 필요한 기능이나 프로퍼티만 정의하여 사용
* 이때 기능이나 프로퍼티를 물려주는 클래스와 이를 상속받는 클래스 사이에서는 다음과 같은 관계가 성립
	- 프로퍼티와 메소드를 물려준 클래스는 부모 클래스, 상위 클래스 또는 슈퍼 클래스, 기본 클래스
	- 프로퍼티와 메소드를 물려받은 클래스는 자식 클래스, 하위 클래스 또는 서브 클래스, 파생 클래스


```
// 어떤 클래스도 상속받지 않는 클래스를 기본 클래스

class A {
	var name = "Class A"
	
	var description : String {
		return "This class nameis \(self.name)"
	}
	
	func foo() {
		print("\(self.nema)'s method foo is called")
	}
}

let a = A()

a.name // "Class A"
a.description // "This class name is Class A"
a.foo()

// Class A's method foo is called
```

#### 서브클래싱 ( Subclassing )

* 기존에 있는 클래스를 기반으로 하여 새로운 클래스를 작성하는 과정

```
class <클래스 이름> : <부모 클래스> {
	// 추가로 구현할 내용
}
```

* 주의할점은 하나의 클래스만 상속 받을 수 있다.
* 다중 상속에서 발생하는 메소드나 프로퍼티의 중첩 및 충돌을 방지하기 위함

```
class B : A {

	var prop = "Class B"
	
	func boo() -> String {
		return "Class B prop = \(self.prop)"
	}
}

let b = B()
b.prop // "Class B"
b.boo  // Class B prop = Class B
```