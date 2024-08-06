# 함수형 프로그래밍

이 문서는 Dart에서 함수형 프로그래밍(FP) 개념을 설명합니다. 주요 개념과 예제를 통해 Dart에서 함수형 프로그래밍을 활용하는 방법을 다룹니다.

## 목차
1. [형변환](#형변환)
2. [Where](#where)
3. [Reduce](#reduce)
4. [Fold](#fold)
5. [Cascading Operator](#cascading-operator)

---

## 형변환

Dart에서는 컬렉션 간의 형변환을 쉽게 할 수 있는 다양한 메서드를 제공합니다. 주요 메서드로는 `asMap`, `toSet`, `toList`, `map` 등이 있습니다.

### asMap
`asMap` 메서드는 리스트를 맵으로 변환합니다. 이 경우 리스트의 인덱스가 맵의 키로 사용됩니다.

```dart
void main() {
  List<String> fruits = ['apple', 'banana', 'orange'];
  Map<int, String> fruitsMap = fruits.asMap();

  print(fruitsMap); // 출력: {0: apple, 1: banana, 2: orange}
}
```

### toSet

`toSet` 메서드는 리스트를 세트(Set)로 변환합니다. 세트는 중복된 요소를 허용하지 않습니다.

```dart
void main() {
  List<int> numbers = [1, 2, 3, 1, 2];
  Set<int> uniqueNumbers = numbers.toSet();

  print(uniqueNumbers); // 출력: {1, 2, 3}
}
```

### toList

`toList` 메서드는 이터러블(Iterable)을 리스트로 변환합니다. 컬렉션의 형식을 리스트로 맞추고자 할 때 사용합니다.

```dart
void main() {
  Set<String> fruitSet = {'apple', 'banana', 'orange'};
  List<String> fruitList = fruitSet.toList();

  print(fruitList); // 출력: [apple, banana, orange]
}
```

### map

`map` 메서드는 컬렉션의 각 요소에 대해 함수를 적용한 새로운 이터러블을 반환합니다.

```dart
void main() {
  List<int> numbers = [1, 2, 3];
  List<int> squaredNumbers = numbers.map((num) => num * num).toList();

  print(squaredNumbers); // 출력: [1, 4, 9]
}
```

map 메서드는 컬렉션의 모든 요소를 변환하거나, 계산된 값을 기반으로 새로운 컬렉션을 만들 때 유용합니다.

## Where

where 메서드는 컬렉션에서 특정 조건을 만족하는 요소만을 필터링하여 반환하는데 사용됩니다. 이 메서드는 조건을 람다 함수로 받아들이며, 조건을 만족하는 요소들만 남깁니다.

```dart
void main() {
  List<int> numbers = [1, 2, 3, 4, 5, 6];
  var evenNumbers = numbers.where((num) => num.isEven);

  print(evenNumbers.toList()); // 출력: [2, 4, 6]
}
```

위 예제에서 where는 리스트에서 짝수만 필터링하여 반환합니다.

## Reduce

reduce 메서드는 컬렉션의 모든 요소를 하나의 결과로 결합하는 데 사용됩니다. 이 메서드는 초기값이 없고, 컬렉션의 첫 번째 요소가 초기값으로 사용됩니다.

```dart
void main() {
  List<int> numbers = [1, 2, 3, 4, 5];
  int sum = numbers.reduce((prev, next) => prev + next);

  print(sum); // 출력: 15
}
```

위 예제에서 reduce는 리스트의 모든 요소를 더하여 하나의 값(합계)으로 결합합니다.

## Fold

fold 메서드는 reduce와 유사하지만, 초기값을 제공할 수 있습니다. 이 메서드는 컬렉션의 각 요소를 초기값에 결합하여 최종 결과를 생성합니다.

```dart
void main() {
  List<int> numbers = [1, 2, 3, 4, 5];
  int sum = numbers.fold(0, (prev, next) => prev + next);
  // final sum = numbers.fold<int>(0, (prev, next) => prev + next);

  print(sum); // 출력: 15
}
```

위 예제에서 fold는 0을 초기값으로 하여 리스트의 모든 요소를 더한 값을 반환합니다.

## Cascading Operator

Cascading operator(..)는 같은 객체에 대해 여러 연산을 연속적으로 수행할 수 있게 해줍니다. 이를 통해 더 간결하고 명확한 코드를 작성할 수 있습니다.

```dart
class Builder {
  String? name;
  int? age;

  void setName(String name) {
    this.name = name;
  }

  void setAge(int age) {
    this.age = age;
  }
}

void main() {
  var builder = Builder()
    ..setName('Alice')
    ..setAge(30);

  print('Name: ${builder.name}, Age: ${builder.age}'); // 출력: Name: Alice, Age: 30
}
```