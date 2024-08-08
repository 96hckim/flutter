import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];
  final _myBox = Hive.box('my_box');

  void loadData() {
    toDoList = _myBox.get("todo_list", defaultValue: []);
  }

  void updateDataBase() {
    _myBox.put("todo_list", toDoList);
  }
}
