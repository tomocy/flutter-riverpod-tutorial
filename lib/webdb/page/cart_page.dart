import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_tutorial/webdb/controller/cart_controller.dart';
import 'package:flutter_riverpod_tutorial/webdb/model/item.dart';
import 'package:flutter_riverpod_tutorial/webdb/page/widget/item_tile.dart';
import 'package:flutter_riverpod_tutorial/webdb/page/widget/remove_item_from_cart_button.dart';

final _currentItem = ScopedProvider<Item>(null);

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            '閉じる',
            style: TextStyle(
              fontSize: 13,
              height: 1,
            ),
          ),
        ),
        middle: const Text('カート'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey[300],
            child: SizedBox(
              height: 55,
              child: Center(
                child: Consumer(
                  builder: (context, watch, _) {
                    final state = watch(cartControllerProvider.state);
                    return Text('合計金額 ${state.totalPrice}円');
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Consumer(
              builder: (context, watch, _) {
                final state = watch(cartControllerProvider.state);
                final items = state.items;

                if (items.isEmpty) {
                  return const Center(
                    child: Text('カートは空です'),
                  );
                }

                return ListView.separated(
                  itemCount: items.length,
                  itemBuilder: (context, i) => ProviderScope(
                    overrides: [
                      _currentItem.overrideWithValue(items[i]),
                    ],
                    child: const _ItemTile(),
                  ),
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemTile extends StatelessWidget {
  const _ItemTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, _) {
        final item = watch(_currentItem);
        return ItemTile(
          label: 'itemTile(in CartPage)',
          trailing: RemoveItemFromCartButton(item: item),
          item: item,
        );
      },
    );
  }
}
