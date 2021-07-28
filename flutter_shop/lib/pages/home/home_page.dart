import 'package:flutter/material.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/model/home_content_model.dart';
import 'package:flutter_shop/pages/home/home_banner.dart';
import 'package:flutter_shop/pages/home/home_category.dart';
import 'package:flutter_shop/pages/home/home_good.dart';
import 'package:flutter_shop/utils/http_util.dart';

/// 首页
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  /// 防止刷新处理 保持当前状态
  @override
  bool get wantKeepAlive => true;

  HomeContentModel? _homeModel;
  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() async {
    var response = await HttpUtil().get(ApiUrl.HOME_CONTENT, isShowLoad: true);
    this.setState(() {
      _homeModel = HomeContentModel.fromJson(response['data']);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      appBar: AppBar(
        title: Text(TextString.HOME_TITLE),
        centerTitle: true,
      ),
      body: _homeModel != null
          ? ListView(
              children: [
                HomeBanner(banners: _homeModel?.banners ?? []),
                HomeCategory(categories: _homeModel?.categories ?? []),
                HomeGood(goods: _homeModel!.goods ?? []),
              ],
            )
          : Container(
              child: Center(
                child: Text("暂无数据"),
              ),
            ),
    );
  }
}
