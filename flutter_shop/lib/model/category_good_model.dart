/// 分类商品列表数据模型
class CategoryGoodListModel {
  List<CategoryGoodModel> categoryGoodList =
      List<CategoryGoodModel>.empty(growable: true);

  CategoryGoodListModel({required this.categoryGoodList});

  /// 从响应数据中取Json数据
  CategoryGoodListModel.fromJson(Map<String, dynamic> json) {
    json['list']?.forEach(
      (v) => categoryGoodList.add(CategoryGoodModel.fromJson(v)),
    );
  }

  /// 将Model数据转成Json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['list'] = this.categoryGoodList.map((v) => v.toString()).toList();
    return data;
  }
}

/// 分类商品数据模型
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
  CategoryGoodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    discount_price = json['discount_price'];
    good_sn = json['good_sn'];
    images = json['images'];
    count = json['count'];
  }

  /// 将Model数据转成Json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['discount_price'] = this.discount_price;
    data['good_sn'] = this.good_sn;
    data['images'] = this.images;
    data['count'] = this.count;
    return data;
  }
}
