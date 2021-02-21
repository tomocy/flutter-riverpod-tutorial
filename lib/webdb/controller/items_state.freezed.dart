// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'items_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ItemsStateTearOff {
  const _$ItemsStateTearOff();

// ignore: unused_element
  _ItemsState call({List<Item> items = const <Item>[], bool loading = false}) {
    return _ItemsState(
      items: items,
      loading: loading,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ItemsState = _$ItemsStateTearOff();

/// @nodoc
mixin _$ItemsState {
  List<Item> get items;
  bool get loading;

  @JsonKey(ignore: true)
  $ItemsStateCopyWith<ItemsState> get copyWith;
}

/// @nodoc
abstract class $ItemsStateCopyWith<$Res> {
  factory $ItemsStateCopyWith(
          ItemsState value, $Res Function(ItemsState) then) =
      _$ItemsStateCopyWithImpl<$Res>;
  $Res call({List<Item> items, bool loading});
}

/// @nodoc
class _$ItemsStateCopyWithImpl<$Res> implements $ItemsStateCopyWith<$Res> {
  _$ItemsStateCopyWithImpl(this._value, this._then);

  final ItemsState _value;
  // ignore: unused_field
  final $Res Function(ItemsState) _then;

  @override
  $Res call({
    Object items = freezed,
    Object loading = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed ? _value.items : items as List<Item>,
      loading: loading == freezed ? _value.loading : loading as bool,
    ));
  }
}

/// @nodoc
abstract class _$ItemsStateCopyWith<$Res> implements $ItemsStateCopyWith<$Res> {
  factory _$ItemsStateCopyWith(
          _ItemsState value, $Res Function(_ItemsState) then) =
      __$ItemsStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Item> items, bool loading});
}

/// @nodoc
class __$ItemsStateCopyWithImpl<$Res> extends _$ItemsStateCopyWithImpl<$Res>
    implements _$ItemsStateCopyWith<$Res> {
  __$ItemsStateCopyWithImpl(
      _ItemsState _value, $Res Function(_ItemsState) _then)
      : super(_value, (v) => _then(v as _ItemsState));

  @override
  _ItemsState get _value => super._value as _ItemsState;

  @override
  $Res call({
    Object items = freezed,
    Object loading = freezed,
  }) {
    return _then(_ItemsState(
      items: items == freezed ? _value.items : items as List<Item>,
      loading: loading == freezed ? _value.loading : loading as bool,
    ));
  }
}

/// @nodoc
class _$_ItemsState with DiagnosticableTreeMixin implements _ItemsState {
  const _$_ItemsState({this.items = const <Item>[], this.loading = false})
      : assert(items != null),
        assert(loading != null);

  @JsonKey(defaultValue: const <Item>[])
  @override
  final List<Item> items;
  @JsonKey(defaultValue: false)
  @override
  final bool loading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItemsState(items: $items, loading: $loading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ItemsState'))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('loading', loading));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ItemsState &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.loading, loading) ||
                const DeepCollectionEquality().equals(other.loading, loading)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(loading);

  @JsonKey(ignore: true)
  @override
  _$ItemsStateCopyWith<_ItemsState> get copyWith =>
      __$ItemsStateCopyWithImpl<_ItemsState>(this, _$identity);
}

abstract class _ItemsState implements ItemsState {
  const factory _ItemsState({List<Item> items, bool loading}) = _$_ItemsState;

  @override
  List<Item> get items;
  @override
  bool get loading;
  @override
  @JsonKey(ignore: true)
  _$ItemsStateCopyWith<_ItemsState> get copyWith;
}
