# CHAPTER 5
#  집단 자료형
* 배열(Array) - 일련번호로 구분되는 순서에 따라 데이터가 정렬된 목록 형태의 자료형
* 집합(Set) - 중복되지 않은 유일 데이터들이 모인 집합 형태의 자료형
* 튜플(Tuple) - 종류에 상관없이 데이터들을 모은 자료형. 수정 및 삭제를 할 수 없음
* 딕셔너리(Dictionary) - 배열과 유사하나 일련번호 대신 키(Key)를 사용하며 키-값으로 연관된 데이터 들이 순서 없이 모인 자료형


## 배열(Array)
* 일련의 순서를 가지는 리스트 형식의 값을 저장하는데 사용되는 자료형
* 배열에 입력되는 개별 아이템들은 각각 순서가 있는데 이를 인덱스(index)라고 한다
* 배열에 저장할 아이템의 타입에는 제약이 없지만, 하나의 배열에 저장하는 아이템 타입은 모두 같아야 한다
* 선언 시 배열에 저장할 아이템 타입을 명확히 정의해야 함
* 배열의 크기는 동적으로 확장할 수 있음

#### 인텍스(index)
* 인덱스는 정수, 0부터 시작하여 아이템이 추가될 때마다 차례대로 증가
* 인덱스는 순서대로 할당, 중간에 값을 생략하거나 건너뛰는 경우는 없기 때문에 처음이나 중간에 아이템이 삭제 되어도 실제로 사라지는 인덱스는 가장 마지막 인덱스
* 인덱스는 아이템의 위치를 가리키는 역할만 할 뿐이기 때문에 배열 내에서 아이템을 삭제하면 그 다음 아이템과 연결되므로 사용 시 주의

### 배열의 정의
* 정적(Static) - 처음부터 배열을 구성하는 아이템을 포함하여 정의하는 방식

```
var cities = ["Seoul", "New York", "LA", "Santiago"]
cities[0] // "Seoul"
cities[1] // "New York"
cities[2] // "LA"
cities[3] // "Santiago"

```

* 동적(Dynamic) - 선언(Declare)과 초기화(initialization)

```
- 문자열 배열의 선언 및 초기화
	var cities = Array<String>()
- 문자열 배열의 선언
	var cities : Array<String>
- 배열의 초기화
	cities = Array()
	// cities 변수는 타입 어노테이션을 통해서 배열의 저장 타입이 지정되었어 Array() 구문만으로 초기화 가능
	var cities : Array<Srting> = Array<String>()
```
// 제네릭(Generic) - <> 기호를 사용하여 배열 내부에서 사용할 아이템 타입을 지정하는 문법

```
- 배열 선언과 초기화
	var cities = [String]()
- 배열 선언
	var cities : [String]
- 배열 초기화.1
	cities = [String]()
- 배열 초기화.2
	cities = [] // 빈 배열을 만들어서 변수에 할당하는 방식
```

* 그 외 선언 및 초기화 방법

case.1

```
var cities : [String] // 선언
cities = [String]() // 초기화
```

case.2

```
var country : [String] // 선언
country = []
```

case.3

```
var list : [Int] = [] // 타입 어노테이션 + 초기화
```

case.4

```
var row : Array<Float> = [Float]() // 타입 어노테이션 + 제네릭 + 초기화
```

case.5

```
var tables : [String] = Array() // 타입 어노테이션 + 구방식의 초기화
```

### 배열의 순회 탐색
* 배열의 길이 

```
var cities = ["Seoul", "New York", "LA", "Santiago"]
let length = cities.count

for i in 0..<length {
	print("\(i)번째 배열의 원소는 \(cities[i])입니다")
} // 반 닫힌 범위 연산자, 카운트 직접사용
```

* 배열의 순회 특성

```
var cities = ["Seoul", "New York", "LA", "Santiago"]

for row in cities {
	let index = cities.index(of : row) // 배열의 인덱스를 확인하여 index 상수에 대입
	print("\(index)번째 배열 원소는 \(row)입니다")
} // index(of:) - 배열의 아이템을 넣으면 몇 번째 인덱스에[ 저장되어 있는지  알려주는 역할
```

### 배열 아이템 동적 추가

- append(_:) - 입력된 값을 배열의 맨 뒤에 추가
- insert(_:at:) - 원하는 위치에 직접 추가하고 싶을 때 사용
- append(contentsOf:) - 여러 개의 아이템을 한번에 추가할 때 사용

```
var cities = [String]() // []

cities.append("Seoul") // ["Seoul"]
cities.append("New York") // ["Seoul","New York"]
cities.insert("Tokyo", at: 1) // ["Seoul","Tokyo","New York"]
cities.append(contentsOf: ["Dubai,"Sydney"]) // // ["Seoul","New York","Dubai,"Sydney"]
```

### 범위 연산자를 이용한 인덱스 참조
* 주로 일정 범위의 배열 아이템을 한꺼번에 읽어 들일 때 사용

```
var alphabet = ["a", "b", "c", "d", "e"]

alphabet[0...2] // ["a", "b", "c"]
alphabet[2...3] // ["c", "d"]
alphabet[1..<3] // ["b", "c"]

alphabet[1...2] = ["1", "2", "3"]
// alphabet = ["a", "1", "2", "3", "d", "e"]
```

## 집합(Set)
* 순서가 중요하지 않을때
* 중복 없이 한번만 저장되어야 하는 데이터들을 다룰 때
* 집합은 내부적으로 해시(Hash) 연산의 결과값을 이용하여 데이터를 저장, 저장할 데이터 타입은 해시 연산(해시값을 계산)을 할 수 있는 타입이어야 한다 - 스위프트에서 제공하는 모든 기본 타입은 기본적으로 해시 연산을 할 수 있다.
* 중복 여부를 직접 처리하지 않아도 된다.(실수로 중복값을 등록해도 자료형 자체가 중복을 제거)

### 집합의 정의
* 집합을 정의 할때, 데이터 리터럴은 배열과 동일, 컴파일러는 집합이 아닌 배열로 인식하기 때문에 타입 어노테이션 Set을 개재해야 한다

```
var genres : Set = ["Classsic", "Rock", "Balad"]

var genres : Set<String> = []
```

* 집합에 아이템 추가

```
genres.insert("Classssic")
genres.insert("Rock")
genres.insert("Balad")
```

* 집합에 아이템 삭제

```
genres.remove("Rock")
genres.removeAll()
```

* 집합에 특정 아이템을 찾을때

```
genres.contains("Balad")
```

### 집합 연산

* 기본 집합 연산

|집합|내용|비고|
|:-:|:-:|:-:|
|intersection(_:)|양쪽 집합에서 공통되는 아이템만 선택하여 새로운 집합을 만들어주는 메소드|교집합|
|symmetricDifference(_:)|양쪽 집합 중에서 어느 한쪽에만 있는 아이템을 선택하여 새로운 집합을 만드는 메소드. 양쪽 모두에 공토으로 있는 아이템은 제외|여집합|
|union(_:)|양쪽 집합에 모든 아이템. 공통으로 있는 아이템 이라고 중복해서 추가되지는 않는다|합집합|
|subtract(_:)|한쪽 집합에 있는 모든 아이템에서 다른 쪽 집합에도 속하는 공통 아이템을 제외. 다른 쪽 집합을 빼는 연산으로 처리|차집합|

* 예제

```
var oddDigits : Set = [1, 3, 5, 7, 9]    // 홀수 집합
var evenDigits : Set = [0, 2, 4, 6, 8]   // 짝수 집합
var primeDigits : Set = [2, 3, 5, 7]     // 소수 집합

oddDigits.intersection(evenDigits).sorted()
// []

oddDigits.symmetricDifference(primeDigits).sorted()
// [1, 2, 9]

oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

oddDigits.subtract(primeDigits)
oddDigits.sorted()
// [1, 9]
```

* 부분집합과 포함관계 판단 연산

|집합|내용|
|:-:|:-:|
|isSubset(of:)|주어진 집합의 값 전체가 특정 집합에 포함되는지를 판단하여 true, false를 반환|
|isSuperset(of:)|주어진 집합이 특정 집합의 모든 값을 포함하는지를 판단하여 true, false를 반환|
|isStrictSubset(of:)와 isStrictSuperset(of:)|서로 일치하는 집합은 동일한 집합으로 판단. 정확히 부분집합, 또는 상위집합일 때만 true를 반환|
|isDisjoint(with:)|두 집합 사이의 공통 값을 확인하여 아무런 공통 값이 없을때 true를, 공통 값이 하나라도 있으면 false를 반환|

* 예제

```
let A : Set = [1, 3, 5, 7, 9]
let B : Set = [3, 5]
let C : Set = [3, 5]
let D : Set = [2, 4, 6]

B.isSubset(of: A) // true
A.isSuperset(of: B) // true
C.isStrictSubset(of: A) // true
C.isStrictSubset(of: B)
A,isDisjoint(with: D)
```

* 중복 값 제거

```
var A = [4, 2, 5, 1, 7, 4, 9, 11, 3, 5, 4]

let B = Set(A)
A = Array(B) // 중복이 제거된 배열
// [2, 4, 9, 5 ,7, 3, 1, 11]
```

## 튜플(Tuple)
* 여러가지 타입의 아이템을 저장 가능
* 선언되고 나면 상수적 성격을 띠므로 값을 추가 삭제 불가능

### 튜플의 정의

* 튜플의 아이템은 인덱스 속성을 이용하여 참조
* 배열과 달리 점(dot)으로 인덱스를 연결하여 사용

```
let tupleValue = ("a", "b", 1, 2.5, true)

tupleValue.0 // "a"
tupleValue.1 // "b"
tupleValue.2 // 1
tupleValue.3 // 2.5
tupleValue.4 true

```

* 튜플은 별도의 선언 구문이 없지만 타입 어노테이션을 사용하기 위해 타입을 정의할 수는 있다

```
var tpl01 : (Int, Int) = (100, 200)
var tpl02 : (Int, String, Int) = (100, "a", 200)
var tpl03 : (Int, (String, String)) = (100, ("t", "v"))
var tpl04 : (String) = ("sample string")
```

* 튜플을 인덱스 속성으로만 접근이 힘들때가 있기 때문에 개별 변수나 상수로 각각 할당받는 바인딩(Binding) 방식의 구문도 제공

```
let tupleValue: (String, Character, Intm Float, Bool) = ("a", "b", 1, 2.5, true)
let (a,b,c,d,e) = tupleValue

// a ==> "a"
// b ==> "b"
// c ==> 1
// d ==> 2.5
// e ==> true
```

```
func getTupleValue() -> (String, String, Int) {
	return ("t", "v", 100)
}

let (a, b, c) = getTupleValue()

// a ==> "t"
// b ==> "v"
// c ==> 100

```

## 딕셔너리(Dictionary)

* 키(Key)와 값(Value)을 연결하여 데이터를 저장하는 자료형
* 인덱스 정수 대신 문자열 등의 고유 키를 사용
* 하나의 키는 하나의 데이터에만 연결
* 하나의 딕셔너리에서 키는 중복 불가. 중복 선언시수정이 이루어져 기존 키에 연결된 데이터가 제거
* 저장할 수 있는 데이터 타입에는 제한이 없지만, 하나의 딕셔너리에 저장하는 데이터 타입은 모두 일치해야 한다
* 딕셔너리의 아이템에는 순서가 없지만 키에는 내부적으로 순서가 있으므로 for~in 구문을 이용한 순회 탐색가능
* 딕셔너리에서 사용할 수 있는 키의 타입은 해시(Hash) 연산이 가능한 타입이어야 한다(해시 연산이 가능하다면 클래스의 인스턴스도 키로 사용 가능)

### 딕셔너리 선언과 초기화

```
Dictionary<키의 타입, 값의 타입>()

var capital = Dictionary<String, String>()

[키로 사용할 타입, 값으로 사용할 타입]()

var capital = [String : String]()

그 외 초기화 방법

var capital : [String : String]

capital = Dictionary<String, String>()
capital = Dictionary()
capital = [String : String]()
capital = [:] 
```

### 딕셔너리 아이템 추가

* 직접 키와 값을 대입하여 아이템 추가
```
var newCapital = [String : String]()
newCapital["JP"] = "Tokyo"
```

* updateValue 메소드를 사용하여 추가
	- updateValue 사용시 기존에 저장된 키가 있으면 연결된 값을 수정, 새로운 키가 입력되면 아이템을 추가

```
newCapital.updateValue("Seoul", forKey : "KR")
// "KR" : "Seoul" 추가

newCapital.updateValue("Sapporo", forKey : "JP")
// 기존 "JP" 키에 연결된 "Tokyo" 에서 "Sapporo" 로 변경
```

* 값 지우기

```
- "값이 없음" 을 의미하는 nil을 직접 입력

newCapital["KR"] = nil

- removeValue

newCapital.removeValue(forKey : "JP")
```

### 딕셔너리의 순회 탐색

```
for row in newCapital {
	let (key, value) = row
	print("현재 데이터는 \(key) : \(value)입니다")
}

for (key, value) in newCapital {
	print("현재 데이터는 \(key) : \(value)입니다")
}
```
