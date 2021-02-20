import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_tutorial/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Counter increments',
    (tester) async {
      await tester.pumpWidget(_build(const Counter()));

      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    },
  );
}

Widget _build(Widget child) => ProviderScope(
      child: MaterialApp(home: child),
    );
