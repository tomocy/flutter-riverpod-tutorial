import 'package:freezed_annotation/freezed_annotation.dart';
// ignore: unused_import
import 'package:flutter/foundation.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
abstract class Item implements _$Item {
  const factory Item({
    @required int id,
    @required @JsonKey(name: 'title') String name,
    @required int price,
    @required String imageUrl,
    @required int quantity,
  }) = _Item;

  // ignore: unused_element
  const Item._();

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Item stock() => copyWith(
        quantity: quantity + 1,
      );

  Item allocate() => copyWith(
        quantity: isInStock ? quantity - 1 : 0,
      );

  bool get isInStock => quantity >= 1;

  int get totalPrice => price * quantity;
}
