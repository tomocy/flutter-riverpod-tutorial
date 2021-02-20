import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class TodoList extends StateNotifier<List<Todo>> {
  TodoList([List<Todo> initial]) : super(initial ?? []);

  void add(String title) {
    state = [
      ...state,
      Todo.uuid(title: title),
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

  Todo.uuid({
    @required String title,
    bool completed = false,
  }) : this(
          id: _uuid.v4(),
          title: title,
          completed: completed,
        );

  final String id;
  final String title;
  final bool completed;

  Todo toggle() {
    return Todo(
      id: this.id,
      title: this.title,
      completed: !completed,
    );
  }
}
