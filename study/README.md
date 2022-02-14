# Widet

### Definition

- 독립적으로 실행되는 작은 프로그램
- 주로 바탕화면 등에서 날씨나 뉴스, 생활정보 등을 보여줌
- 그래픽이나 데이터 요소를 처리하는 함수를 가지고 있음

### What is Widget in fluttter?

- UI를 만들고 구성하는 모든 기본 단위 요소
- 눈에 보이지 않는 요소들까지 위젯
- Everything is a widget

### Types of Widgets

- Stateless Widget(상대가 없는 정적인 위젯)
  - 이전 상호작용의 어떠한 값도 저장하지 않음
- Stateful Widget(계속 움직임이나 변화가 있는 위젯)
  - Value 값을 지속적으로 추적 보존
- Inherited Widget

### Flutter Widget tree

- Widget들은 tree 구조로 정리될 수 있음
- 한 Widget내에 얼마든지 다른 Widget들이 포함될 수 있음
- Widget은 부모 위젯과 자식 위젯으로 구성
- Parent widget을 widget container라고 부르기도 함
