import 'package:flutter_riverpod_tutorial/webdb/model/item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// ignore: unused_import
import 'package:flutter/foundation.dart';

part 'cart_state.freezed.dart';

@freezed
abstract class CartState implements _$CartState {
  const factory CartState({
    @Default(<int, Item>{}) Map<int, Item> itemsById,
  }) = _CartState;

  // ignore: unused_element
  const CartState._();

  bool get isEmpty => itemsCount == 0;

  int get itemsCount => itemsById.values.length;

  int get totalPrice => items.fold(0, (sum, item) => sum + item.totalPrice);

  List<Item> get items => itemsById.values.toList();
}
