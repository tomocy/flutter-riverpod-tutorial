import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

String _generateRandomString(int len) {
  final random = Random.secure();
  final values = List<int>.generate(len, (i) => random.nextInt(255));
  return base64Url.encode(values);
}

class TodoList extends StateNotifier<List<Todo>> {
  TodoList([List<Todo> initial]) : super(initial ?? []);

  void add(String title) {
    state = [
      ...state,
      Todo.withRandomId(title: title),
    ];
  }

  void remove(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }

  void toggle(String id) {
    state = state.map((todo) => todo.id == id ? todo.toggle() : todo).toList();
  }
}

class Todo {
  const Todo({
    @required this.id,
    @required this.title,
    this.completed = false,
  })  : assert(id != null),
        assert(title != null);

  Todo.withRandomId({
    @required String title,
    bool completed = false,
  }) : this(
          id: _generateRandomString(10),
          title: title,
          completed: completed,
        );

  final String id;
  final String title;
  final bool completed;

  Todo toggle() {
    return Todo(
      id: id,
      title: title,
      completed: !completed,
    );
  }
}
