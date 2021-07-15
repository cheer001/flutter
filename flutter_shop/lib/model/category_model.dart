/// 分类列表数据模型
class CategoryListModel {
  /// 分类数据列表
  List<CategoryModel>? categoryList = List<CategoryModel>.empty(growable: true);

  CategoryListModel({required this.categoryList});

  /// 从响应数据中取Json数据
  CategoryListModel.fromJson(Map<String, dynamic> json) {
    json['list']?.forEach((v) {
      categoryList?.add(CategoryModel.fromJson(v));
    });
  }

  /// 将数据转成Json对象
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['list'] = this.categoryList?.map((v) => v.toJson()).toList();
    return data;
  }
}

/// 分类数据模型
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
  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    pid = json['pid'];
    level = json['level'];
    image = json['image'];
  }

  /// 将数据转成Json对象
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['pid'] = this.pid;
    data['level'] = this.level;
    data['image'] = this.image;
    return data;
  }
}
