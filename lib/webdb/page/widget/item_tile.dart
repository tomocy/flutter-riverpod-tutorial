import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_tutorial/webdb/logger/logger.dart';
import 'package:flutter_riverpod_tutorial/webdb/model/item.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({
    Key key,
    this.label = 'itemTile',
    this.trailing,
    @required this.item,
  })  : assert(item != null),
        super(key: key);

  final String label;
  final Widget trailing;
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, _) {
        context.read(loggerProvider).info('$label: build ${item.name}');

        return ListTile(
          leading: Image.network(item.imageUrl),
          title: Text(item.name),
          subtitle: Text(item.isInStock ? '在庫: ${item.quantity}' : '在庫なし'),
          trailing: trailing,
        );
      },
    );
  }
}
