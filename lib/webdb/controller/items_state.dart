import 'package:flutter_riverpod_tutorial/webdb/model/item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// ignore: unused_import
import 'package:flutter/foundation.dart';

part 'items_state.freezed.dart';

@freezed
abstract class ItemsState with _$ItemsState {
  const factory ItemsState({
    @Default(<Item>[]) List<Item> items,
    @Default(false) bool loading,
  }) = _ItemsState;
}
