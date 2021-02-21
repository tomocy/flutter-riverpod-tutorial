import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_tutorial/webdb/controller/items_state.dart';
import 'package:flutter_riverpod_tutorial/webdb/model/items_repo.dart';
import 'package:flutter_riverpod_tutorial/webdb/model/item.dart';

final itemsControllerProvider = StateNotifierProvider(
  (ref) => ItemsController(ref.read(itemsRepoProvider)),
);

class ItemsController extends StateNotifier<ItemsState> {
  ItemsController(this.repo) : super(const ItemsState()) {
    fetch();
  }

  final ItemsRepo repo;

  Future<void> fetch() async {
    state = state.copyWith(
      loading: true,
    );
    final items = await repo.fetch();
    state = state.copyWith(
      items: items,
      loading: false,
    );
  }

  void add(Item item) {
    addAll([item]);
  }

  void addAll(List<Item> items) {
    state = state.copyWith(
      items: [
        ...state.items,
        ...items,
      ],
    );
  }

  void stock(Item item) {
    state = state.copyWith(
      items: state.items
          .map((stored) => stored.id == item.id ? stored.stock() : stored)
          .toList(),
    );
  }

  void allocate(Item item) {
    state = state.copyWith(
      items: state.items
          .map((stored) => stored.id == item.id ? stored.allocate() : stored)
          .toList(),
    );
  }
}
