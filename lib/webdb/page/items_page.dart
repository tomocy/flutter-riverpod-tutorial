import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_tutorial/webdb/controller/cart_controller.dart';
import 'package:flutter_riverpod_tutorial/webdb/controller/controller.dart';
import 'package:flutter_riverpod_tutorial/webdb/model/item.dart';
import 'package:flutter_riverpod_tutorial/webdb/page/cart_page.dart';
import 'package:flutter_riverpod_tutorial/webdb/page/widget/add_item_to_cart_button.dart';
import 'package:flutter_riverpod_tutorial/webdb/page/widget/item_tile.dart';

final _currentItem = ScopedProvider<Item>(null);

class ItemsPage extends StatelessWidget {
  const ItemsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          onPressed: () {
            Navigator.of(context).push<void>(CupertinoPageRoute(
              builder: (_) => const CartPage(),
            ));
          },
          child: Consumer(
            builder: (context, watch, _) {
              final state = watch(cartControllerProvider.state);

              return state.isEmpty
                  ? const Text(
                      'カート',
                      style: TextStyle(
                        fontSize: 13,
                        height: 1,
                      ),
                    )
                  : Text(
                      'カート(${state.itemsCount})',
                      style: const TextStyle(
                        fontSize: 13,
                        height: 1,
                      ),
                    );
            },
          ),
        ),
        middle: const Text('商品リスト'),
      ),
      body: Consumer(
        builder: (context, watch, _) {
          final state = watch(itemsControllerProvider.state);

          if (state.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          final items = state.items;

          if (items.isEmpty) {
            return const Center(
              child: Text('商品はありません'),
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
            separatorBuilder: (context, _) => const SizedBox(height: 5),
          );
        },
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
          label: 'itemTile(in ItemsPage)',
          trailing: AddItemToCartButton(item: item),
          item: item,
        );
      },
    );
  }
}
