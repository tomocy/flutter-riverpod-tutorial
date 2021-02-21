// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$CartStateTearOff {
  const _$CartStateTearOff();

// ignore: unused_element
  _CartState call({Map<int, Item> itemsById = const <int, Item>{}}) {
    return _CartState(
      itemsById: itemsById,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $CartState = _$CartStateTearOff();

/// @nodoc
mixin _$CartState {
  Map<int, Item> get itemsById;

  @JsonKey(ignore: true)
  $CartStateCopyWith<CartState> get copyWith;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res>;
  $Res call({Map<int, Item> itemsById});
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res> implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  final CartState _value;
  // ignore: unused_field
  final $Res Function(CartState) _then;

  @override
  $Res call({
    Object itemsById = freezed,
  }) {
    return _then(_value.copyWith(
      itemsById:
          itemsById == freezed ? _value.itemsById : itemsById as Map<int, Item>,
    ));
  }
}

/// @nodoc
abstract class _$CartStateCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$CartStateCopyWith(
          _CartState value, $Res Function(_CartState) then) =
      __$CartStateCopyWithImpl<$Res>;
  @override
  $Res call({Map<int, Item> itemsById});
}

/// @nodoc
class __$CartStateCopyWithImpl<$Res> extends _$CartStateCopyWithImpl<$Res>
    implements _$CartStateCopyWith<$Res> {
  __$CartStateCopyWithImpl(_CartState _value, $Res Function(_CartState) _then)
      : super(_value, (v) => _then(v as _CartState));

  @override
  _CartState get _value => super._value as _CartState;

  @override
  $Res call({
    Object itemsById = freezed,
  }) {
    return _then(_CartState(
      itemsById:
          itemsById == freezed ? _value.itemsById : itemsById as Map<int, Item>,
    ));
  }
}

/// @nodoc
class _$_CartState extends _CartState with DiagnosticableTreeMixin {
  const _$_CartState({this.itemsById = const <int, Item>{}})
      : assert(itemsById != null),
        super._();

  @JsonKey(defaultValue: const <int, Item>{})
  @override
  final Map<int, Item> itemsById;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartState(itemsById: $itemsById)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CartState'))
      ..add(DiagnosticsProperty('itemsById', itemsById));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CartState &&
            (identical(other.itemsById, itemsById) ||
                const DeepCollectionEquality()
                    .equals(other.itemsById, itemsById)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(itemsById);

  @JsonKey(ignore: true)
  @override
  _$CartStateCopyWith<_CartState> get copyWith =>
      __$CartStateCopyWithImpl<_CartState>(this, _$identity);
}

abstract class _CartState extends CartState {
  const _CartState._() : super._();
  const factory _CartState({Map<int, Item> itemsById}) = _$_CartState;

  @override
  Map<int, Item> get itemsById;
  @override
  @JsonKey(ignore: true)
  _$CartStateCopyWith<_CartState> get copyWith;
}
