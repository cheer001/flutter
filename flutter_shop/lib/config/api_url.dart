class ApiUrl {
  ///Url前缀
  static const String URL_HEAD = 'http://192.168.5.81:8000/api';

  ///登录
  static const String USER_LOGIN = '/user/login';

  ///注册
  static const String USER_REGISTER = '/user/register';

  ///首页数据
  static const String HOME_CONTENT = '/client/home/content';

  ///商品详情
  static const String GOOD_DETAIL = '/client/good/detail';

  ///一级分类
  static const String CATEGORY_FIRST = '/client/category/first';

  ///二级分类
  static const String CATEGORY_SECOND = '/client/category/second';

  ///获取分类下的商品列表
  static const String CATEGORY_GOOD_LIST = '/client/category/good/list';

  ///查询购物车商品列表
  static const String CART_LIST = '/client/cart/list';

  ///更新购物车商品
  static const String CART_UPDATE = '/client/cart/update';

  ///删除购物车商品
  static const String CART_DELETE = '/client/cart/delete';

  ///添加商品至购物车
  static const String CART_ADD = '/client/cart/add';

  ///提交订单
  static const String ORDER_ADD = '/client/order/add';

  ///订单列表
  static const String ORDER_LIST = '/client/order/list';
}
