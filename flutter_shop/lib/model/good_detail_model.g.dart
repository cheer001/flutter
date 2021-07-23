// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'good_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodDetailModel _$GoodDetailModelFromJson(Map<String, dynamic> json) {
  return GoodDetailModel(
    id: json['id'] as int?,
    name: json['name'] as String?,
    price: json['price'] as int?,
    discount_price: json['discount_price'] as int?,
    count: json['count'] as int?,
    good_sn: json['good_sn'] as int?,
    fright: json['fright'] as int?,
    images: json['images'] as String?,
    detail: json['detail'] as String?,
  );
}

Map<String, dynamic> _$GoodDetailModelToJson(GoodDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'discount_price': instance.discount_price,
      'count': instance.count,
      'good_sn': instance.good_sn,
      'fright': instance.fright,
      'images': instance.images,
      'detail': instance.detail,
    };
