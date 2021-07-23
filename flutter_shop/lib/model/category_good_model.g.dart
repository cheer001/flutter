// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_good_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryGoodListModel _$CategoryGoodListModelFromJson(
    Map<String, dynamic> json) {
  return CategoryGoodListModel(
    categoryGoodList: (json['categoryGoodList'] as List<dynamic>)
        .map((e) => CategoryGoodModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CategoryGoodListModelToJson(
        CategoryGoodListModel instance) =>
    <String, dynamic>{
      'categoryGoodList': instance.categoryGoodList,
    };

CategoryGoodModel _$CategoryGoodModelFromJson(Map<String, dynamic> json) {
  return CategoryGoodModel(
    id: json['id'] as int?,
    name: json['name'] as String?,
    price: json['price'] as int?,
    discount_price: json['discount_price'] as int?,
    good_sn: json['good_sn'] as int?,
    images: json['images'] as String?,
    count: json['count'] as int?,
  );
}

Map<String, dynamic> _$CategoryGoodModelToJson(CategoryGoodModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'discount_price': instance.discount_price,
      'good_sn': instance.good_sn,
      'images': instance.images,
      'count': instance.count,
    };
