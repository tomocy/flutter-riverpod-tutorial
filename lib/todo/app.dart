import 'package:flutter/material.dart';
import 'package:flutter_riverpod_tutorial/todo/TodoList.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      home: const TodoList(),
    );
  }
}