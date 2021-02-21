import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_tutorial/webdb/infra/http/items_repo.dart'
    as http;
import 'package:flutter_riverpod_tutorial/webdb/model/item.dart';

final Provider<ItemsRepo> itemsRepoProvider = Provider((_) => http.ItemsRepo());

// ignore: one_member_abstracts
abstract class ItemsRepo {
  Future<List<Item>> fetch();
}
