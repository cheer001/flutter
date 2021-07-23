import 'package:json_annotation/json_annotation.dart';

part 'good_detail_model.g.dart';

/// 商品详情数据模型
@JsonSerializable()
class GoodDetailModel {
  //Id
  int? id;
  //名称
  String? name;
  //价格
  int? price;
  //折扣价
  int? discount_price;
  //数量
  int? count;
  //编号
  int? good_sn;
  //运费
  int? fright;
  //图片
  String? images;
  //详情
  String? detail;

  //构造函数
  GoodDetailModel({
    required this.id,
    required this.name,
    required this.price,
    required this.discount_price,
    required this.count,
    required this.good_sn,
    required this.fright,
    required this.images,
    required this.detail,
  });

  ///取Json数据
  factory GoodDetailModel.fromJson(Map<String, dynamic> json) =>
      _$GoodDetailModelFromJson(json);

  ///将数据转成Json
  Map<String, dynamic> toJson() => _$GoodDetailModelToJson(this);
}
