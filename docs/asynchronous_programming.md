# 비동기 프로그래밍

이 문서는 Dart에서 비동기 프로그래밍의 개념을 설명합니다. 주요 개념과 예제를 통해 비동기 작업을 어떻게 처리하는지 이해할 수 있습니다.

## 목차
1. [소개](#소개)
2. [Future](#future)
3. [Stream](#stream)
4. [Broadcast Stream](#broadcast-stream)
5. [yield](#yield)

---

## 소개

비동기 프로그래밍은 오래 걸리는 작업을 수행하면서도 애플리케이션이 응답성을 유지할 수 있도록 하는 프로그래밍 방식입니다. Dart에서는 `Future`와 `Stream`을 통해 비동기 작업을 처리할 수 있으며, `async`와 `await`를 사용하여 비동기 코드도 동기 코드처럼 작성할 수 있습니다.

## Future

`Future`는 나중에 완료될 비동기 작업을 나타내는 객체입니다. `Future`는 작업이 완료되면 값을 반환하거나 에러를 던질 수 있습니다.

```dart
void main() async {
  final result1 = await addNumbers(1, 1);
  final result2 = await addNumbers(2, 2);

  print('result1: $result1');
  print('result2: $result2');
  print('result1 + result2 = ${result1 + result2}');
}

Future<int> addNumbers(int number1, int number2) async {
    print('계산 시작: $number1 + $number2}');

    await Future.delayed(Duration(seconds: 2), () {
        print('계산 완료: $number1 + $number2 = ${number1 + number2}');
    }); // await 키워드는 비동기 작업이 완료될 때까지 코드 실행을 잠시 중단합니다. await는 async 함수 내에서만 사용할 수 있습니다.

    print('함수 완료: $number1 + $number2');

    return number1 + number2; // async 함수는 항상 Future를 반환합니다.
}
```

## Stream

`Stream`은 일련의 비동기 이벤트를 처리할 수 있는 객체입니다. `Stream`은 데이터의 흐름을 비동기적으로 처리하는 데 사용됩니다.

```dart
Stream<int> numberStream() async* {
  for (int i = 1; i <= 5; i++) {
    yield i;
    await Future.delayed(Duration(seconds: 1));
  }
}

void main() {
  numberStream().listen((number) {
    print(number); // 1초마다 1부터 5까지 출력
  });
}
```

## Broadcast Stream

기본적으로 `Stream`은 단일 구독만 허용합니다. `Broadcast Stream`은 여러 리스너가 같은 `Stream`에 구독할 수 있도록 합니다.

```dart
Stream<int> broadcastStream = numberStream().asBroadcastStream();

void main() {
  broadcastStream.listen((number) {
    print('Listener 1: $number');
  });

  broadcastStream.listen((number) {
    print('Listener 2: $number');
  });
}
```

이 예제에서는 두 리스너가 동일한 `broadcastStream`을 구독하고, 각 리스너가 동일한 데이터를 수신합니다.

## yield

`yield` 키워드는 Stream 생성기에서 값을 생성하는 데 사용됩니다. `async*` 함수를 사용하여 `Stream`을 생성하고, `yield`를 사용하여 값을 방출합니다.

```dart
Stream<int> calculate(int number) async* {
  for (int i = 1; i <= 5; i++) {
    yield i * number;
    await Future.delayed(Duration(seconds: 1));
  }
}

Stream<int> calculateAllStream() async* {
  yield* calculate(1);
  yield* calculate(1000);
} // yield* 를 사용하여 Stream 을 순차적으로 실행할 수 있다.

void main() {
  calculateAllStream().listen((val) {
    print(val);
  });
}
```