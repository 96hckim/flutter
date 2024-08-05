# 객체지향 프로그래밍

이 문서는 Dart에서 객체지향 프로그래밍(OOP) 개념을 설명합니다. 주요 개념은 다음과 같습니다.

## 목차
1. [이론](#이론)
2. [생성자(Constructor)](#생성자constructor)
3. [Getter and Setter](#getter-and-setter)
4. [Private 속성](#private-속성)
5. [상속(Inheritance)](#상속inheritance)
6. [Override](#override)
7. [Static](#static)
8. [Interface](#interface)
9. [Generic](#generic)

---

## 이론

객체지향 프로그래밍(Object-Oriented Programming, OOP)은 프로그래밍 패러다임 중 하나로, 데이터를 객체로 취급하고 이 객체들 간의 상호작용을 통해 프로그램을 설계하고 구현합니다. OOP의 주요 개념으로는 클래스와 객체, 캡슐화, 상속, 다형성 등이 있습니다.

## 생성자(Constructor)

생성자는 객체가 생성될 때 호출되는 특수한 메서드입니다. 클래스의 속성을 초기화하는 데 사용됩니다.

```dart
class Person {
  String name;
  int age;

  // 기본 생성자
  Person(this.name, this.age);

  // 네임드 생성자
  Person.withName(this.name) {
    age = 0; // 기본값 설정
  }
}

void main() {
  var person1 = Person('Alice', 30);
  var person2 = Person.withName('Bob');

  print('${person1.name}, ${person1.age}'); // 출력: Alice, 30
  print('${person2.name}, ${person2.age}'); // 출력: Bob, 0
}
```

## Getter and Setter

Getter와 Setter는 클래스의 속성을 읽고 쓸 때 사용하는 메서드입니다. 이를 통해 속성에 대한 접근을 제어할 수 있습니다.

```dart
class Rectangle {
  double _width;
  double _height;

  Rectangle(this._width, this._height);

  double get area => _width * _height;

  set width(double width) {
    _width = width;
  }

  set height(double height) {
    _height = height;
  }
}

void main() {
  var rect = Rectangle(10, 20);
  print(rect.area); // 출력: 200

  rect.width = 15;
  print(rect.area); // 출력: 300
}
```

## Private 속성

Dart에서 속성이나 메서드가 private가 되려면 이름 앞에 _를 붙입니다. Private 속성은 클래스 외부에서 접근할 수 없습니다.

```dart
class BankAccount {
  double _balance = 0;

  void deposit(double amount) {
    _balance += amount;
  }

  void withdraw(double amount) {
    if (_balance >= amount) {
      _balance -= amount;
    }
  }

  double get balance => _balance;
}

void main() {
  var account = BankAccount();
  account.deposit(100);
  account.withdraw(50);

  print(account.balance); // 출력: 50
}
```

## 상속(Inheritance)

상속은 기존 클래스의 기능을 확장하여 새로운 클래스를 만들 때 사용됩니다. Dart에서는 extends 키워드를 사용합니다.

```dart
class Animal {
  void makeSound() {
    print('Animal makes a sound');
  }
}

class Dog extends Animal {
  void bark() {
    print('Dog barks');
  }
}

void main() {
  var dog = Dog();
  dog.makeSound(); // 출력: Animal makes a sound
  dog.bark(); // 출력: Dog barks
}
```

## Override

상위 클래스의 메서드를 하위 클래스에서 재정의할 때 사용됩니다. @override 어노테이션을 사용하여 재정의된 메서드를 표시합니다.

```dart
class Animal {
  void makeSound() {
    print('Animal makes a sound');
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print('Dog barks');
  }
}

void main() {
  var dog = Dog();
  dog.makeSound(); // 출력: Dog barks
}
```

## Static

static 키워드를 사용하면 클래스의 인스턴스가 아니라 클래스 자체에 속하는 속성이나 메서드를 정의할 수 있습니다.

```dart
class MathUtils {
  static double pi = 3.14159;

  static double circleArea(double radius) {
    return pi * radius * radius;
  }
}

void main() {
  print(MathUtils.pi); // 출력: 3.14159
  print(MathUtils.circleArea(5)); // 출력: 78.53975
}
```

## Interface

Dart에서는 인터페이스를 명시적으로 정의하지 않고, 클래스를 인터페이스처럼 사용할 수 있습니다. 인터페이스를 구현하려면 implements 키워드를 사용합니다.

```dart
class Printer {
  void printDocument() {
    print('Printing document...');
  }
}

class Scanner {
  void scanDocument() {
    print('Scanning document...');
  }
}

class AllInOnePrinter implements Printer, Scanner {
  @override
  void printDocument() {
    print('All-in-One Printer is printing...');
  }

  @override
  void scanDocument() {
    print('All-in-One Printer is scanning...');
  }
}

void main() {
  var device = AllInOnePrinter();
  device.printDocument(); // 출력: All-in-One Printer is printing...
  device.scanDocument(); // 출력: All-in-One Printer is scanning...
}
```

## Generic

제네릭을 사용하면 클래스나 함수가 다양한 타입을 처리할 수 있도록 할 수 있습니다. Dart에서는 <> 안에 타입을 지정하여 제네릭을 구현합니다.

```dart
class Box<T> {
  T content;

  Box(this.content);

  T get getContent => content;
}

void main() {
  var intBox = Box<int>(123);
  var stringBox = Box<String>('Hello');

  print(intBox.getContent); // 출력: 123
  print(stringBox.getContent); // 출력: Hello
}
```