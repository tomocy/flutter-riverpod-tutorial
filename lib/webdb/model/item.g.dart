// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Item _$_$_ItemFromJson(Map json) {
  return _$_Item(
    id: json['id'] as int,
    name: json['title'] as String,
    price: json['price'] as int,
    imageUrl: json['imageUrl'] as String,
    quantity: json['quantity'] as int,
  );
}

Map<String, dynamic> _$_$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.name,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
      'quantity': instance.quantity,
    };
