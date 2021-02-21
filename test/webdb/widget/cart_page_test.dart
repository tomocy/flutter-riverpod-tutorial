import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_tutorial/webdb/app.dart';
import 'package:flutter_riverpod_tutorial/webdb/logger/logger.dart';
import 'package:flutter_riverpod_tutorial/webdb/model/item.dart';
import 'package:flutter_riverpod_tutorial/webdb/model/items_repo.dart';
import 'package:flutter_riverpod_tutorial/webdb/page/items_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:simple_logger/simple_logger.dart';

void main() {
  testWidgets(
    'CartPage shows addded items and buttons to remove them from cart',
    (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(_build(App()));

        await tester.pumpAndSettle();

        await tester.tap(find.text('追加する').first);
        await tester.pumpAndSettle();
        await tester.tap(find.text('追加する').first);
        await tester.tap(find.text('追加する').first);
        await tester.pumpAndSettle();

        await tester.tap(find.text('カート(2)'));
        await tester.pumpAndSettle();

        expect(find.text('カート'), findsOneWidget);
        expect(find.text('閉じる'), findsOneWidget);

        expect(find.text('name 1'), findsOneWidget);
        expect(find.text('在庫: 1'), findsOneWidget);
        expect(find.text('name 2'), findsOneWidget);
        expect(find.text('在庫: 2'), findsOneWidget);

        expect(find.text('削除する'), findsNWidgets(2));

        await tester.tap(find.text('削除する').first);
        await tester.pumpAndSettle();

        expect(find.text('name 1'), findsNothing);
        expect(find.text('name 2'), findsOneWidget);

        expect(find.text('削除する'), findsNWidgets(1));

        await tester.tap(find.text('削除する').first);
        await tester.pumpAndSettle();

        expect(find.text('name 2'), findsOneWidget);
        expect(find.text('在庫: 1'), findsOneWidget);

        expect(find.text('削除する'), findsNWidgets(1));

        await tester.tap(find.text('削除する').first);
        await tester.pumpAndSettle();

        expect(find.text('name 2'), findsNothing);

        expect(find.text('削除する'), findsNothing);

        expect(find.text('カートは空です'), findsOneWidget);
      });
    },
  );

  testWidgets(
    'CartPage navigates to ImagePage',
    (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(_build(App()));

        await tester.tap(find.text('カート'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('閉じる'));
        await tester.pumpAndSettle();

        expect(find.byType(ItemsPage), findsOneWidget);
      });
    },
  );
}

Widget _build(Widget child) => ProviderScope(
      overrides: [
        loggerProvider.overrideWithValue(SimpleLogger()..setLevel(Level.OFF)),
        itemsRepoProvider.overrideWithValue(_ItemsRepo()),
      ],
      child: MaterialApp(
        home: child,
      ),
    );

class _ItemsRepo implements ItemsRepo {
  @override
  Future<List<Item>> fetch() async {
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
