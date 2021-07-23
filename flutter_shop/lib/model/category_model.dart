import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

/// 分类列表数据模型
@JsonSerializable()
class CategoryListModel {
  /// 分类数据列表
  List<CategoryModel>? categoryList = List<CategoryModel>.empty(growable: true);

  CategoryListModel({required this.categoryList});

  /// 从响应数据中取Json数据
  factory CategoryListModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryListModelFromJson(json);

  /// 将数据转成Json对象
  Map<String, dynamic> toJson() => _$CategoryListModelToJson(this);
}

/// 分类数据模型
@JsonSerializable()
class CategoryModel {
  /// ID
  int? id;

  /// 名称
  String? name;

  /// 父分类ID
  int? pid;

  /// 等级
  String? level;

  /// 图片
  String? image;

  CategoryModel({
    required this.id,
    required this.name,
    required this.pid,
    required this.level,
    required this.image,
  });

  /// 从响应数据中取Json数据
  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  /// 将数据转成Json对象
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
