import 'package:json_annotation/json_annotation.dart';

part 'home_content_model.g.dart';

/// 主页内容模型类
@JsonSerializable()
class HomeContentModel {
  List<HomeBannerModel>? banners = List<HomeBannerModel>.empty(growable: true);
  List<HomeCategoryModel>? categories =
      List<HomeCategoryModel>.empty(growable: true);
  List<HomeGoodModel>? goods = List<HomeGoodModel>.empty(growable: true);

  HomeContentModel({
    required this.banners,
    required this.categories,
    required this.goods,
  });
  factory HomeContentModel.fromJson(Map<String, dynamic> json) =>
      _$HomeContentModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeContentModelToJson(this);
}

/// 轮播图模型类
@JsonSerializable()
class HomeBannerModel {
  String? image;
  HomeBannerModel({required this.image});

  factory HomeBannerModel.fromJson(Map<String, dynamic> json) =>
      _$HomeBannerModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBannerModelToJson(this);
}

/// 商品模型类
@JsonSerializable()
class HomeGoodModel {
  int? id;

  ///价格
  int? price;

  ///折扣价
  int? discount_price;

  ///名称
  String? name;

  ///商品编号
  int? good_sn;

  ///图片
  String? images;

  HomeGoodModel({
    required this.id,
    required this.price,
    required this.discount_price,
    required this.name,
    required this.good_sn,
    required this.images,
  });

  factory HomeGoodModel.fromJson(Map<String, dynamic> json) =>
      _$HomeGoodModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeGoodModelToJson(this);
}

/// 商品模型类
@JsonSerializable()
class HomeCategoryModel {
  int? id;
  String? name; //名称
  int? pid; //价格
  String? level; //等级
  String? image; //图片
  HomeCategoryModel({
    required this.id,
    required this.name,
    required this.pid,
    required this.level,
    required this.image,
  });

  factory HomeCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$HomeCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeCategoryModelToJson(this);
}
