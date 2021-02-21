import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_tutorial/webdb/controller/cart_controller.dart';
import 'package:flutter_riverpod_tutorial/webdb/controller/items_controller.dart';
import 'package:flutter_riverpod_tutorial/webdb/model/item.dart';

class RemoveItemFromCartButton extends StatelessWidget {
  const RemoveItemFromCartButton({
    Key key,
    @required this.item,
  })  : assert(item != null),
        super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        context.read(cartControllerProvider).remove(item);
        context.read(itemsControllerProvider).stock(item);
      },
      child: Text(
        '削除する',
        style: TextStyle(
          fontSize: 13,
          color: Theme.of(context).errorColor,
        ),
      ),
    );
  }
}
