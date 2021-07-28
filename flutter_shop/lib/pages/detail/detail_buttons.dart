import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/config/color.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/model/good_detail_model.dart';
import 'package:flutter_shop/services/http_service.dart';
import 'package:flutter_shop/utils/http_util.dart';
import 'package:flutter_shop/utils/router_util.dart';
import 'package:flutter_shop/utils/storage_util.dart';
import 'package:flutter_shop/utils/token_util.dart';
import 'package:flutter_shop/widgets/medium_button.dart';
import 'package:flutter_shop/widgets/show_message.dart';

class DetailButtons extends StatelessWidget {
  GoodDetailModel? goodDetailModel;

  DetailButtons({Key? key, required this.goodDetailModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(740),
      height: ScreenUtil().setHeight(80),
      color: Colors.white,
      child: Row(
        children: [
          Container(
            width: ScreenUtil().setHeight(100),
            alignment: Alignment.center,
            child: Icon(
              Icons.shopping_cart,
              size: 35,
              color: SColor.PRIMARY_COLOR,
            ),
          ),
          MediumButton(
            text: SString.ADD_TO_CART,
            color: SColor.ADD_TO_CART_COLOR,
            onPressed: () {
              addGoodToCart(context);
            },
          ),
          SizedBox(width: 20, height: 70),
          MediumButton(
            text: SString.BUY_GOOD,
            color: SColor.BUY_NOW_BUTTON_COLOR,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  addGoodToCart(BuildContext context) async {
    String token = await TokenUtil.getToken();
    if (token.isEmpty) {
      RouterUtil.toLoginPage(context);
    }
    var userInfo = await TokenUtil.getUserInfo();
    var data = {
      'user_id': userInfo['id'],
      'good_id': this.goodDetailModel?.id,
      'good_count': this.goodDetailModel?.count,
      'good_name': this.goodDetailModel?.name,
      'good_price': this.goodDetailModel?.price,
      'good_image': this.goodDetailModel?.images?.split(',')[0],
    };
    var response = await HttpUtil().post(ApiUrl.CART_ADD, params: data);
    if (response.data['code'] == 0) {
      MessageWidget.show(SString.ADD_SUCCESS);
      // TODO 购物车刷新
    }
  }
}
