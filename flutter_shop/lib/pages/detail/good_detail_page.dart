import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/model/good_detail_model.dart';
import 'package:flutter_shop/pages/detail/detail_buttons.dart';
import 'package:flutter_shop/pages/detail/detail_info.dart';
import 'package:flutter_shop/services/http_service.dart';
import 'package:flutter_shop/utils/http_util.dart';
import 'package:flutter_shop/utils/router_util.dart';

class GoodDetailPage extends StatefulWidget {
  String goodId;
  GoodDetailPage({Key? key, required this.goodId}) : super(key: key);

  @override
  _GoodDetailPageState createState() => _GoodDetailPageState();
}

class _GoodDetailPageState extends State<GoodDetailPage> {
  GoodDetailModel? goodDetailModel;
  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() async {
    var param = {'id': widget.goodId};
    var response = await HttpUtil().get(ApiUrl.GOOD_DETAIL, params: param);
    this.setState(() {
      goodDetailModel = GoodDetailModel.fromJson(response['data']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            RouterUtil.pop(context);
          },
        ),
        title: Text(TextString.GOOD_DETAIL_TITLE),
      ),
      body: goodDetailModel != null
          ? Stack(
              children: [
                ListView(
                  children: [
                    DetailInfo(
                      goodDetailModel: goodDetailModel,
                    ),
                    Html(data: goodDetailModel!.detail.toString()),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: DetailButtons(
                    goodDetailModel: goodDetailModel,
                  ),
                )
              ],
            )
          : Text(TextString.LOADING),
    ));
  }
}
