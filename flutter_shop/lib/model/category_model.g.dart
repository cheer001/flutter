// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryListModel _$CategoryListModelFromJson(Map<String, dynamic> json) {
  return CategoryListModel(
    categoryList: (json['list'] as List<dynamic>?)
        ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CategoryListModelToJson(CategoryListModel instance) =>
    <String, dynamic>{
      'categoryList': instance.categoryList,
    };

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return CategoryModel(
    id: json['id'] as int?,
    name: json['name'] as String?,
    pid: json['pid'] as int?,
    level: json['level'] as String?,
    image: json['image'] as String?,
  );
}

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'pid': instance.pid,
      'level': instance.level,
      'image': instance.image,
    };
