# Dart 3.0 신규 문법 및 기능

이 문서는 Dart 3.0에서 도입된 주요 신규 문법과 기능을 정리한 것입니다. Dart 3.0은 성능 개선, 언어 확장 및 개발자 경험을 향상시키는 여러 기능을 제공합니다.

## 목차
1. [Pattern Matching](#pattern-matching)
2. [Records](#records)
3. [Sealed Classes](#sealed-classes)
4. [Enhanced Switch Statement](#enhanced-switch-statement)
5. [Class Modifiers](#class-modifiers)
6. [Improved Type Inference](#improved-type-inference)
7. [Extended Super Initializer](#extended-super-initializer)

---

## Pattern Matching

패턴 매칭은 값을 구조적으로 분해하고 검사하는 강력한 기능입니다.

```dart
void main() {
  var (x, y) = (1, 2); // Tuple destructuring using records
  print('x: $x, y: $y'); // 출력: x: 1, y: 2
}

void handleValue(dynamic value) {
  switch (value) {
    case int:
      print('Integer value: $value');
      break;
    case String:
      print('String value: $value');
      break;
    case List<int> [1, 2, 3]:
      print('Matched list pattern');
      break;
    default:
      print('Unknown type');
  }
}
```

## Records

간단한 데이터 구조를 정의할 수 있는 Record 타입이 도입되었습니다. 이는 여러 값을 하나의 변수로 그룹화하는 데 유용합니다.

```dart
void main() {
  var person = ('Alice', 30);
  print('Name: ${person.$1}, Age: ${person.$2}'); // 출력: Name: Alice, Age: 30

  // Named fields
  var namedPerson = (name: 'Bob', age: 25);
  print('Name: ${namedPerson.name}, Age: ${namedPerson.age}'); // 출력: Name: Bob, Age: 25
}
```

## Sealed Classes

sealed 클래스는 클래스 계층 구조를 닫아 상속을 제한합니다. 이 기능은 특정 클래스 계층을 정의하고자 할 때 유용합니다.

```dart
sealed class Shape {}

class Circle extends Shape {
  final double radius;
  Circle(this.radius);
}

class Square extends Shape {
  final double side;
  Square(this.side);
}

void describeShape(Shape shape) {
  switch (shape) {
    case Circle c:
      print('Circle with radius ${c.radius}');
      break;
    case Square s:
      print('Square with side ${s.side}');
      break;
  }
}
```

## Enhanced Switch Statement

switch 문이 강화되어, 패턴 매칭과 함께 사용할 수 있습니다. 또한, switch 문이 모든 경우를 다루도록 강제하는 exhaustiveness 체크도 포함되었습니다.

```dart
void handleShape(Shape shape) {
  switch (shape) {
    case Circle(radius: var r) when r > 10:
      print('Large circle with radius $r');
      break;
    case Circle(radius: var r):
      print('Small circle with radius $r');
      break;
    case Square(side: var s):
      print('Square with side $s');
      break;
  }
}
```

## Class Modifiers

클래스에 새로운 접근 제어자인 base, final, sealed 등이 추가되었습니다.

base: 클래스를 다른 클래스가 상속할 수 있지만, 기본 클래스는 변경할 수 없습니다.
final: 클래스를 더 이상 상속할 수 없습니다.
sealed: 특정 클래스만 상속할 수 있습니다.

```dart
base class Animal {}
class Dog extends Animal {} // 허용

final class Plant {}
// class Tree extends Plant {} // 오류: 상속 불가

sealed class Vehicle {}
// class Car extends Vehicle {} // 같은 파일 내에서만 상속 가능
```

## Improved Type Inference

타입 추론이 더 개선되어, 코드 작성 시 더욱 직관적이고 간결한 방식으로 타입을 다룰 수 있습니다. 특히 복잡한 제네릭 타입을 사용할 때 유용합니다.

```dart
void main() {
  var numbers = [1, 2, 3]; // List<int>로 자동 추론
  var doubled = numbers.map((n) => n * 2); // Iterable<int>로 자동 추론
  print(doubled.toList()); // 출력: [2, 4, 6]
}
```

## Extended Super Initializer

상위 클래스의 생성자를 호출할 때 더 많은 유연성을 제공합니다. 이제 super를 사용해 더 복잡한 초기화 로직을 구현할 수 있습니다.

```dart
class Parent {
  final String name;
  Parent(this.name);
}

class Child extends Parent {
  Child(String name) : super(name.toUpperCase());
}

void main() {
  var child = Child('alice');
  print(child.name); // 출력: ALICE
}
```