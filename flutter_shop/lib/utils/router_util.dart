import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/category/category_good_list_page.dart';
import 'package:flutter_shop/pages/detail/good_detail_page.dart';
import 'package:flutter_shop/pages/user/login_page.dart';
import 'package:flutter_shop/pages/user/member_page.dart';
import 'package:flutter_shop/pages/user/register_page.dart';

class RouterUtil {
  /// 跳转至分类商品列表页
  static toCategoryGoodListPage(
    BuildContext context,
    int firstCategoryId,
    int secondCategoryId,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryGoodListPage(
          firstCategoryId: firstCategoryId,
          secondCategoryId: secondCategoryId,
        ),
      ),
    );
  }

  /// 跳转至登录页
  static toLoginPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  /// 跳转至注册页
  static toRegisterPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterPage(),
      ),
    );
  }

  /// 跳转至个人中心
  static toMemberPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MemberPage(),
      ),
    );
  }

  /// 跳转至商品详情页
  static toGoodDetailPage(BuildContext context, String goodId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GoodDetailPage(
          goodId: goodId,
        ),
      ),
    );
  }

  static pop(BuildContext context) {
    Navigator.pop(context);
  }
}
