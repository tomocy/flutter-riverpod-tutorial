import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_tutorial/webdb/app.dart';
import 'package:flutter_riverpod_tutorial/webdb/logger/logger.dart';
import 'package:flutter_riverpod_tutorial/webdb/model/item.dart';
import 'package:flutter_riverpod_tutorial/webdb/model/items_repo.dart';
import 'package:flutter_riverpod_tutorial/webdb/page/cart_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:simple_logger/simple_logger.dart';

void main() {
  testWidgets(
    'ItemsPage shows fetched items and buttons to add them to cart',
    (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(_build(App()));

        expect(find.text('商品リスト'), findsOneWidget);
        expect(find.text('カート'), findsOneWidget);

        await tester.pumpAndSettle();

        expect(find.text('name 0'), findsOneWidget);
        expect(find.text('在庫なし'), findsOneWidget);

        expect(find.text('name 1'), findsOneWidget);
        expect(find.text('在庫: 1'), findsOneWidget);

        expect(find.text('name 2'), findsOneWidget);
        expect(find.text('在庫: 2'), findsOneWidget);

        expect(find.text('name 3'), findsNothing);

        expect(find.text('追加する'), findsNWidgets(2));

        await tester.tap(find.text('追加する').first);
        await tester.pumpAndSettle();

        expect(find.text('カート(1)'), findsOneWidget);
        expect(find.text('在庫なし'), findsNWidgets(2));
        expect(find.text('在庫: 2'), findsOneWidget);

        expect(find.text('追加する'), findsNWidgets(1));

        await tester.tap(find.text('追加する').first);
        await tester.pumpAndSettle();

        expect(find.text('カート(2)'), findsOneWidget);
        expect(find.text('在庫なし'), findsNWidgets(2));
        expect(find.text('在庫: 1'), findsOneWidget);

        expect(find.text('追加する'), findsNWidgets(1));

        await tester.tap(find.text('追加する').first);
        await tester.pumpAndSettle();

        expect(find.text('カート(2)'), findsOneWidget);
        expect(find.text('在庫なし'), findsNWidgets(3));

        expect(find.text('追加する'), findsNothing);
      });
    },
  );

  testWidgets(
    'ItemsPage shows empty state',
    (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          _build(
            App(),
            itemsRepo: _ItemsRepo(
              fetcher: () async {
                return [];
              },
            ),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.text('商品はありません'), findsOneWidget);
      });
    },
  );

  testWidgets(
    'ItemsPage shows loading indicator',
    (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          _build(
            App(),
            itemsRepo: _ItemsRepo(
              fetcher: () async {
                return Future.delayed(
                  const Duration(seconds: 3),
                  () async {
                    return [];
                  },
                );
              },
            ),
          ),
        );

        await tester.pump(const Duration(seconds: 1));

        expect(find.byType(CircularProgressIndicator), findsOneWidget);

        await tester.pumpAndSettle();
      });
    },
  );

  testWidgets(
    'ItemsPage navigates to CartPage',
    (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(_build(App()));

        await tester.tap(find.text('カート'));
        await tester.pumpAndSettle();

        expect(find.byType(CartPage), findsOneWidget);
      });
    },
  );
}

Widget _build(
  Widget child, {
  ItemsRepo itemsRepo = const _ItemsRepo(),
}) =>
    ProviderScope(
      overrides: [
        loggerProvider.overrideWithValue(SimpleLogger()..setLevel(Level.OFF)),
        itemsRepoProvider.overrideWithValue(itemsRepo),
      ],
      child: MaterialApp(
        home: child,
      ),
    );

class _ItemsRepo implements ItemsRepo {
  const _ItemsRepo({
    this.fetcher,
  });

  final Future<List<Item>> Function() fetcher;

  @override
  Future<List<Item>> fetch() async {
    if (fetcher != null) {
      return fetcher();
    }

    return List.generate(
      3,
      (i) => Item(
        id: i,
        name: 'name $i',
        price: i * 1000,
        imageUrl: '',
        quantity: i,
      ),
    );
  }
}
