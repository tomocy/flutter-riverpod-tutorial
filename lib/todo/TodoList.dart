import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_tutorial/todo/todo.dart' as model;

final todoListProvider = StateNotifierProvider((_) => model.TodoList([
      model.Todo.uuid(
        title: 'Buy some milk',
      ),
      model.Todo.uuid(
        title: 'Sleep well',
      ),
      model.Todo.uuid(
        title: 'Get up early',
      ),
    ]));

final _currentTodo = ScopedProvider<model.Todo>(null);

class TodoList extends StatelessWidget {
  const TodoList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, watch, _) {
          final todos = watch(todoListProvider.state);
          return ListView.separated(
            itemCount: todos.length,
            itemBuilder: (context, i) {
              return Dismissible(
                key: ValueKey(todos[i].id),
                onDismissed: (direction) {
                  context.read(todoListProvider).remove(todos[i].id);
                },
                background: Container(
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                child: ProviderScope(
                  overrides: [
                    _currentTodo.overrideWithValue(todos[i]),
                  ],
                  child: const TodoItem(),
                ),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: 10),
          );
        },
      ),
      bottomSheet: Container(
        child: TextField(
          decoration: InputDecoration(
            labelText: 'What needs to be done?',
          ),
          onSubmitted: (title) {
            context.read(todoListProvider).add(title);
          },
        ),
      ),
    );
  }
}

class TodoItem extends StatelessWidget {
  const TodoItem();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, _) {
        final todo = watch(_currentTodo);
        return ListTile(
          title: Text(todo.title),
          subtitle: Text(todo.completed ? 'Completed' : ''),
          trailing: IconButton(
            onPressed: () {
              context.read(todoListProvider).toggle(todo.id);
            },
            icon: todo.completed
                ? const Icon(Icons.undo)
                : const Icon(Icons.done),
          ),
        );
      },
    );
  }
}
