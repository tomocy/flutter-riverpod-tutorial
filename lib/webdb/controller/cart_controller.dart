import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_tutorial/webdb/controller/cart_state.dart';
import 'package:flutter_riverpod_tutorial/webdb/model/item.dart';

final cartControllerProvider = StateNotifierProvider((_) => CartController());

class CartController extends StateNotifier<CartState> {
  CartController() : super(const CartState());

  void add(Item item) {
    state = state.copyWith(
      itemsById: <int, Item>{
        ...state.itemsById,
        item.id: (state.itemsById[item.id] ??
                item.copyWith(
                  quantity: 0,
                ))
            .stock(),
      },
    );
  }

  void remove(Item item) {
    if (!state.itemsById.containsKey(item.id)) {
      return;
    }

    state = state.copyWith(
      itemsById: <int, Item>{
        ...state.itemsById,
        item.id: state.itemsById[item.id].allocate(),
      }..removeWhere((_, item) => !item.isInStock),
    );
  }
}
