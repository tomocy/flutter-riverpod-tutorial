import 'package:flutter/material.dart';
import 'package:flutter_riverpod_tutorial/todo/todo_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Todo',
      home: TodoList(),
    );
  }
}
