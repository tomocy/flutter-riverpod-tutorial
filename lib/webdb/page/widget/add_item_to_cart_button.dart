import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_tutorial/webdb/controller/cart_controller.dart';
import 'package:flutter_riverpod_tutorial/webdb/controller/items_controller.dart';
import 'package:flutter_riverpod_tutorial/webdb/model/item.dart';

class AddItemToCartButton extends StatelessWidget {
  const AddItemToCartButton({
    Key key,
    @required this.item,
  })  : assert(item != null),
        super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return item.isInStock
        ? CupertinoButton(
            onPressed: () {
              context.read(cartControllerProvider).add(item);
              context.read(itemsControllerProvider).allocate(item);
            },
            child: const Text(
              '追加する',
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          )
        : CupertinoButton(
            onPressed: () {},
            child: const Text(
              '',
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          );
  }
}
