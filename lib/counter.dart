import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider((_) => 0);

class Counter extends StatelessWidget {
  const Counter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Consumer(
          builder: (context, watch, _) {
            final count = watch(counterProvider).state;
            return Text('$count');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read(counterProvider).state++,
        child: const Icon(Icons.add),
      ),
    );
  }
}
