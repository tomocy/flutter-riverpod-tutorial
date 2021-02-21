// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
class _$ItemTearOff {
  const _$ItemTearOff();

// ignore: unused_element
  _Item call(
      {@required int id,
      @required @JsonKey(name: 'title') String name,
      @required int price,
      @required String imageUrl,
      @required int quantity}) {
    return _Item(
      id: id,
      name: name,
      price: price,
      imageUrl: imageUrl,
      quantity: quantity,
    );
  }

// ignore: unused_element
  Item fromJson(Map<String, Object> json) {
    return Item.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Item = _$ItemTearOff();

/// @nodoc
mixin _$Item {
  int get id;
  @JsonKey(name: 'title')
  String get name;
  int get price;
  String get imageUrl;
  int get quantity;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res>;
  $Res call(
      {int id,
      @JsonKey(name: 'title') String name,
      int price,
      String imageUrl,
      int quantity});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res> implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  final Item _value;
  // ignore: unused_field
  final $Res Function(Item) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object price = freezed,
    Object imageUrl = freezed,
    Object quantity = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
      price: price == freezed ? _value.price : price as int,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      quantity: quantity == freezed ? _value.quantity : quantity as int,
    ));
  }
}

/// @nodoc
abstract class _$ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$ItemCopyWith(_Item value, $Res Function(_Item) then) =
      __$ItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      @JsonKey(name: 'title') String name,
      int price,
      String imageUrl,
      int quantity});
}

/// @nodoc
class __$ItemCopyWithImpl<$Res> extends _$ItemCopyWithImpl<$Res>
    implements _$ItemCopyWith<$Res> {
  __$ItemCopyWithImpl(_Item _value, $Res Function(_Item) _then)
      : super(_value, (v) => _then(v as _Item));

  @override
  _Item get _value => super._value as _Item;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object price = freezed,
    Object imageUrl = freezed,
    Object quantity = freezed,
  }) {
    return _then(_Item(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
      price: price == freezed ? _value.price : price as int,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      quantity: quantity == freezed ? _value.quantity : quantity as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Item extends _Item with DiagnosticableTreeMixin {
  const _$_Item(
      {@required this.id,
      @required @JsonKey(name: 'title') this.name,
      @required this.price,
      @required this.imageUrl,
      @required this.quantity})
      : assert(id != null),
        assert(name != null),
        assert(price != null),
        assert(imageUrl != null),
        assert(quantity != null),
        super._();

  factory _$_Item.fromJson(Map<String, dynamic> json) =>
      _$_$_ItemFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'title')
  final String name;
  @override
  final int price;
  @override
  final String imageUrl;
  @override
  final int quantity;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Item(id: $id, name: $name, price: $price, imageUrl: $imageUrl, quantity: $quantity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Item'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('quantity', quantity));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.quantity, quantity) ||
                const DeepCollectionEquality()
                    .equals(other.quantity, quantity)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(quantity);

  @JsonKey(ignore: true)
  @override
  _$ItemCopyWith<_Item> get copyWith =>
      __$ItemCopyWithImpl<_Item>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ItemToJson(this);
  }
}

abstract class _Item extends Item {
  const _Item._() : super._();
  const factory _Item(
      {@required int id,
      @required @JsonKey(name: 'title') String name,
      @required int price,
      @required String imageUrl,
      @required int quantity}) = _$_Item;

  factory _Item.fromJson(Map<String, dynamic> json) = _$_Item.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'title')
  String get name;
  @override
  int get price;
  @override
  String get imageUrl;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$ItemCopyWith<_Item> get copyWith;
}
