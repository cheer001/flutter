/// 主页内容模型类
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
  HomeContentModel.fromJson(Map<String, dynamic> json) {
    print('json :$json');
    json['banners']?.forEach((v) {
      banners!.add(HomeBannerModel.fromJson(v));
    });
    json['category']?.forEach((v) {
      categories!.add(HomeCategoryModel.fromJson(v));
    });
    json['goods']?.forEach((v) {
      goods!.add(HomeGoodModel.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['banners'] = this.banners?.map((v) => v.toJson()).toList();
    data['category'] = this.categories?.map((v) => v.toJson()).toList();
    data['goods'] = this.goods?.map((v) => v.toJson()).toList();
    return data;
  }
}

///
class HomeBannerModel {
  String? image;
  HomeBannerModel({required this.image});

  HomeBannerModel.fromJson(Map<String, dynamic> json) {
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["image"] = this.image;
    return data;
  }
}

/// 商品模型类
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

  HomeGoodModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    price = json["price"];
    discount_price = json["discount_price"];
    name = json["name"];
    good_sn = json["good_sn"];
    images = json["images"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = this.id;
    data["price"] = this.price;
    data["discount_price"] = this.discount_price;
    data["name"] = this.name;
    data["good_sn"] = this.good_sn;
    data["images"] = this.images;
    return data;
  }
}

/// 商品模型类
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

  HomeCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    pid = json["pid"];
    level = json["level"];
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["pid"] = this.pid;
    data["level"] = this.level;
    data["image"] = this.image;
    return data;
  }
}
