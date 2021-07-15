import 'package:flutter_shop/model/cart_model.dart';

/// 数据中心
class DataCenter {
  static _DataCenter? _instance = _DataCenter();

  static _DataCenter? getInstance() {
    if (_instance == null) {
      _instance = _DataCenter();
    }
    return _instance;
  }
}

class _DataCenter {
  /// 购物车列表对象
  List<CartModel> cartList = [];
}
