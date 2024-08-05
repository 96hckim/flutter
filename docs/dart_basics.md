# Dart 언어 기본기

이 문서는 Dart 언어의 기본 문법과 기능을 설명합니다. 각 섹션에서는 Dart의 다양한 개념과 사용법을 다루고 있습니다.

## 목차
1. [Hello World](#hello-world)
2. [변수 선언하기](#변수-선언하기)
3. [변수 타입](#변수-타입)
4. [Nullable vs Non-nullable](#nullable-vs-non-nullable)
5. [Final vs Const](#final-vs-const)
6. [Operators](#operators)
7. [List](#list)
8. [Map](#map)
9. [Set](#set)
10. [If 문](#if-문)
11. [Loops](#loops)
12. [Enum](#enum)
13. [함수](#함수)
14. [Typedef](#typedef)

---

## Hello World

Dart에서 가장 기본적인 "Hello World" 프로그램입니다.

```dart
void main() {
  print('Hello, World!');
}
```

## 변수 선언하기

Dart에서 변수를 선언하는 방법입니다.

```dart
var name = 'John Doe';  // 타입을 명시하지 않고 선언
String anotherName = 'Jane Doe';  // 타입을 명시하고 선언
```

## 변수 타입

Dart의 변수 타입에는 다양한 종류가 있습니다.

```dart
int age = 30;
double height = 5.9;
bool isStudent = true;
String name = 'Alice';
```

## Nullable vs Non-nullable

Dart는 null-safety를 지원하여 nullable과 non-nullable 변수를 구분할 수 있습니다.

```dart
int? nullableNumber;
int nonNullableNumber = 10;
```

## Final vs Const

Dart에서 final과 const는 값을 변경할 수 없는 변수를 선언할 때 사용됩니다.

```dart
final String name = 'Alice';  // 런타임 시 할당
const int age = 30;  // 컴파일 시 할당
```

## Operators

Dart에서 사용할 수 있는 기본 연산자들입니다.

```dart
int sum = 3 + 2;
int difference = 5 - 3;
int product = 4 * 2;
double quotient = 8 / 2;
int remainder = 5 % 2;

bool isEqual = (3 == 3);
bool isNotEqual = (3 != 4);
bool isGreater = (5 > 3);
bool isLess = (2 < 3);

bool andResult = (true && false);
bool orResult = (true || false);
bool notResult = !true;
```

## List

Dart의 List는 순서가 있는 요소의 모음을 나타냅니다.

```dart
List<int> numbers = [1, 2, 3, 4, 5];
print(numbers[0]);  
numbers.add(6);
print(numbers.length);
```

## Map

Dart의 Map은 키-값 쌍의 모음을 나타냅니다.

```dart
Map<String, int> ages = {
  'Alice': 30,
  'Bob': 25,
  'Charlie': 28
};

print(ages['Alice']);  
ages['Dave'] = 40;  
print(ages.length);  
```

## Set

Dart의 Set은 중복되지 않는 요소의 모음을 나타냅니다.

```dart
Set<String> fruits = {'apple', 'banana', 'orange'};
fruits.add('apple');
print(fruits.length);  
print(fruits.contains('banana'));
```

## If 문

Dart의 조건문인 if 문은 특정 조건에 따라 코드 블록을 실행합니다.

```dart
int age = 20;

if (age > 18) {
  print('Adult');
} else {
  print('Minor');
}
```

## Loops

Dart의 반복문인 for, while, do-while 문은 특정 조건에 따라 코드 블록을 반복 실행합니다.

```dart
for (int i = 0; i < 5; i++) {
  print(i);
}

int j = 0;
while (j < 5) {
  print(j);
  j++;
}

int k = 0;
do {
  print(k);
  k++;
} while (k < 5);
```

## Enum

Enum은 열거형 타입을 정의할 때 사용합니다.

```dart
enum Direction { north, south, east, west }

void main() {
  Direction dir = Direction.north;

  switch (dir) {
    case Direction.north:
      print('Heading north');
      break;
    case Direction.south:
      print('Heading south');
      break;
    case Direction.east:
      print('Heading east');
      break;
    case Direction.west:
      print('Heading west');
      break;
  }
}
```

## 함수

Dart에서 함수를 정의하고 사용하는 방법을 설명합니다. Dart의 함수는 여러 가지 방식으로 정의될 수 있으며, 다양한 파라미터 유형을 지원합니다.

```dart
void sayHello(String name) {
  print('Hello, $name!');
}

int add(int a, int b) {
  return a + b;
}

void main() {
  sayHello('Alice');
  int result = add(3, 5);
  print(result); 
}
```

Positional Parameter
순서가 중요한 파라미터입니다. 함수 호출 시 지정한 순서대로 값이 전달됩니다.

```dart
int multiply(int a, int b) {
  return a * b;
}

void main() {
  int result = multiply(2, 3);  // 2는 a에, 3은 b에 할당됨
  print(result); // 출력: 6
}
```

Optional Parameter
있어도 되고 없어도 되는 파라미터입니다. 대괄호 []로 감싸서 정의합니다.

```dart
void printMessage(String message, [String? prefix]) {
  if (prefix != null) {
    print('$prefix: $message');
  } else {
    print(message);
  }
}

void main() {
  printMessage('Hello'); // 출력: Hello
  printMessage('Hello', 'INFO'); // 출력: INFO: Hello
}
```

Named Parameter
이름이 있는 파라미터로, 호출 시 순서와 관계없이 이름으로 값을 전달할 수 있습니다. 중괄호 {}로 감싸서 정의합니다.

```dart
void createUser({required String name, int age = 18}) {
  print('User: $name, Age: $age');
}

void main() {
  createUser(name: 'Alice', age: 30); // 출력: User: Alice, Age: 30
  createUser(name: 'Bob'); // 출력: User: Bob, Age: 18
}
```

Arrow Function
간결하게 표현할 수 있는 함수로, 화살표 =>를 사용하여 정의합니다.

```dart
int square(int x) => x * x;

void main() {
  int result = square(5);
  print(result); // 출력: 25
}
```

## Typedef

typedef는 함수 타입을 정의하고, 여러 곳에서 일관되게 사용할 수 있도록 합니다.

```dart
typedef IntOperation = int Function(int, int);

int add(int a, int b) => a + b;
int subtract(int a, int b) => a - b;

void main() {
  IntOperation operation;

  operation = add;
  print(operation(3, 4)); 

  operation = subtract;
  print(operation(3, 4));  
}
```