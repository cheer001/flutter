import 'package:json_annotation/json_annotation.dart';

part 'category_good_model.g.dart';

/// 分类商品列表数据模型
@JsonSerializable()
class CategoryGoodListModel {
  List<CategoryGoodModel> categoryGoodList =
      List<CategoryGoodModel>.empty(growable: true);

  CategoryGoodListModel({required this.categoryGoodList});

  /// 从响应数据中取Json数据
  factory CategoryGoodListModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryGoodListModelFromJson(json);

  /// 将Model数据转成Json
  Map<String, dynamic> toJson() => _$CategoryGoodListModelToJson(this);
}

/// 分类商品数据模型
@JsonSerializable()
class CategoryGoodModel {
  /// ID
  int? id;

  /// 名称
  String? name;

  /// 价格
  int? price;

  /// 折扣价
  int? discount_price;

  /// 商品编号
  int? good_sn;

  /// 图片
  String? images;

  /// 数量
  int? count;

  CategoryGoodModel({
    required this.id,
    required this.name,
    required this.price,
    required this.discount_price,
    required this.good_sn,
    required this.images,
    required this.count,
  });

  /// 从响应数据中取Json数据
  factory CategoryGoodModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryGoodModelFromJson(json);

  /// 将Model数据转成Json
  Map<String, dynamic> toJson() => _$CategoryGoodModelToJson(this);
}
