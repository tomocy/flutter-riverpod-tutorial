import 'package:flutter/material.dart';
import 'package:flutter_riverpod_tutorial/webdb/page/items_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'WEB+DB',
      home: ItemsPage(),
    );
  }
}
