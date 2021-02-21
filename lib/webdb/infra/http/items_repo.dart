import 'dart:convert';

import 'package:flutter_riverpod_tutorial/webdb/model/items_repo.dart'
    as contract;
import 'package:flutter_riverpod_tutorial/webdb/model/model.dart';
import 'package:http/http.dart';

final _client = Client();

class ItemsRepo implements contract.ItemsRepo {
  @override
  Future<List<Item>> fetch() async {
    final resp = await _client.get(
      'https://www.mocky.io/v2/5c2df3b92f00008e2f175350',
    );
    if (resp.statusCode != 200) {
      return <Item>[];
    }

    final body = (json.decode(resp.body) as List).cast<Map<String, dynamic>>();
    return body.map<Item>((json) => Item.fromJson(json)).toList();
  }
}
