// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeContentModel _$HomeContentModelFromJson(Map<String, dynamic> json) {
  return HomeContentModel(
    banners: (json['banners'] as List<dynamic>?)
        ?.map((e) => HomeBannerModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    categories: (json['category'] as List<dynamic>?)
        ?.map((e) => HomeCategoryModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    goods: (json['goods'] as List<dynamic>?)
        ?.map((e) => HomeGoodModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$HomeContentModelToJson(HomeContentModel instance) =>
    <String, dynamic>{
      'banners': instance.banners,
      'categories': instance.categories,
      'goods': instance.goods,
    };

HomeBannerModel _$HomeBannerModelFromJson(Map<String, dynamic> json) {
  return HomeBannerModel(
    image: json['image'] as String?,
  );
}

Map<String, dynamic> _$HomeBannerModelToJson(HomeBannerModel instance) =>
    <String, dynamic>{
      'image': instance.image,
    };

HomeGoodModel _$HomeGoodModelFromJson(Map<String, dynamic> json) {
  return HomeGoodModel(
    id: json['id'] as int?,
    price: json['price'] as int?,
    discount_price: json['discount_price'] as int?,
    name: json['name'] as String?,
    good_sn: json['good_sn'] as int?,
    images: json['images'] as String?,
  );
}

Map<String, dynamic> _$HomeGoodModelToJson(HomeGoodModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'discount_price': instance.discount_price,
      'name': instance.name,
      'good_sn': instance.good_sn,
      'images': instance.images,
    };

HomeCategoryModel _$HomeCategoryModelFromJson(Map<String, dynamic> json) {
  return HomeCategoryModel(
    id: json['id'] as int?,
    name: json['name'] as String?,
    pid: json['pid'] as int?,
    level: json['level'] as String?,
    image: json['image'] as String?,
  );
}

Map<String, dynamic> _$HomeCategoryModelToJson(HomeCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'pid': instance.pid,
      'level': instance.level,
      'image': instance.image,
    };
