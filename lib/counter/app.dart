import 'package:flutter/material.dart';
import 'package:flutter_riverpod_tutorial/counter/counter.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter',
      home: const Counter(),
    );
  }
}
