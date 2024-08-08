import 'package:flutter/material.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/widgets/dialog_box.dart';
import 'package:todo_app/widgets/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ToDoDatabase db = ToDoDatabase();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    db.loadData();
  }

  void _toggleTaskCompletion(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = value ?? false;
    });
    db.updateDataBase();
  }

  void _addTask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        db.toDoList.add([_controller.text, false]);
        _controller.clear();
      });
      db.updateDataBase();
    }
    Navigator.of(context).pop();
  }

  void _deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  void _openNewTaskDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: _addTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text("TO DO"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openNewTaskDialog,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => _toggleTaskCompletion(value, index),
            deleteFunction: (context) => _deleteTask(index),
          );
        },
      ),
    );
  }
}
