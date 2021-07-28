import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/model/category_good_model.dart';
import 'package:flutter_shop/services/http_service.dart';
import 'package:flutter_shop/utils/http_util.dart';
import 'package:flutter_shop/utils/router_util.dart';

class CategoryGoodListPage extends StatefulWidget {
  int firstCategoryId = 0;
  int secondCategoryId = 0;
  CategoryGoodListPage({
    Key? key,
    required this.firstCategoryId,
    required this.secondCategoryId,
  }) : super(key: key);

  @override
  _CategoryGoodListPageState createState() => _CategoryGoodListPageState();
}

class _CategoryGoodListPageState extends State<CategoryGoodListPage> {
  // GlobalKey<RefreshFooterState> footer = GlobalKey<RefreshFooterState>();
  late EasyRefreshController controller;
  late ScrollController scrollController;
  List<CategoryGoodModel> goodList = [];
  int pageIndex = 1;
  int pageSize = 2;
  bool noMoreData = true;

  // 反向
  bool reverse = false;
  // 方向
  Axis direction = Axis.vertical;
  // Header浮动
  bool headerFloat = false;
  // 无限加载
  bool enableInfiniteLoad = true;
  // 控制结束
  bool enableControlFinish = false;
  // 任务独立
  bool taskIndependence = false;
  // 震动
  bool vibration = true;
  // 是否开启刷新
  bool enableRefresh = true;
  // 是否开启加载
  bool enableLoad = true;
  // 顶部回弹
  bool topBouncing = true;
  // 底部回弹
  bool bottomBouncing = true;

  @override
  void initState() {
    super.initState();
    controller = EasyRefreshController();
    scrollController = ScrollController();
    print("分类商品列表页。。。");
    getGoodList();
  }

  getGoodList() async {
    pageIndex = 1;
    var param = {
      'category_first': widget.firstCategoryId,
      'category_second': widget.secondCategoryId,
      'page_index': pageIndex,
      'page_size': pageSize
    };
    var response =
        await HttpUtil().get(ApiUrl.CATEGORY_GOOD_LIST, params: param);
    print(response.data['data']);
    CategoryGoodListModel model =
        CategoryGoodListModel.fromJson(response.data['data']);
    this.setState(() {
      goodList = model.categoryGoodList;
      noMoreData = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SString.GOOD_LIST_TITLE),
      ),
      body: goodList.length > 0
          ? Container(
              width: 400,
              child: EasyRefresh.custom(
                enableControlFinishRefresh: true,
                enableControlFinishLoad: true,
                controller: controller,
                scrollController: scrollController,
                header: enableRefresh
                    ? ClassicalHeader(
                        enableInfiniteRefresh: false,
                        bgColor: headerFloat
                            ? Theme.of(context).primaryColor
                            : Colors.transparent,
                        infoColor: headerFloat ? Colors.black87 : Colors.teal,
                        float: headerFloat,
                        enableHapticFeedback: vibration,
                        refreshText: "提示刷新",
                        refreshReadyText: "准备刷新",
                        refreshingText: "正在刷新",
                        refreshedText: "刷新完成",
                        refreshFailedText: "刷新失败",
                        noMoreText: "没有更多",
                        infoText: "更多信息",
                      )
                    : null,
                footer: enableLoad
                    ? ClassicalFooter(
                        enableInfiniteLoad: enableInfiniteLoad,
                        enableHapticFeedback: vibration,
                        loadText: "提示加载",
                        loadReadyText: "准备加载",
                        loadingText: "正在加载",
                        loadedText: "加载完成",
                        loadFailedText: "加载失败",
                        noMoreText: "没有更多",
                        infoText: "更多信息",
                      )
                    : null,
                onRefresh: enableRefresh
                    ? () async {
                        await Future.delayed(Duration(seconds: 1), () {
                          getGoodList();
                          if (mounted) {
                            if (!enableControlFinish) {
                              controller.resetLoadState();
                              controller.finishRefresh();
                            }
                          }
                        });
                      }
                    : null,
                onLoad: enableLoad
                    ? () async {
                        await Future.delayed(Duration(seconds: 1), () {
                          getMoreData();
                          if (mounted) {
                            if (!enableControlFinish) {
                              controller.finishLoad(noMore: noMoreData);
                            }
                          }
                        });
                      }
                    : null,
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return goodListItem(goodList, index);
                      },
                      childCount: goodList.length,
                    ),
                  ),
                ],
              ),
            )
          : Center(child: Text(SString.NO_MORE_DATA)),
    );
  }

  getMoreData() async {
    pageIndex++;
    var param = {
      'category_first': widget.firstCategoryId,
      'category_second': widget.secondCategoryId,
      'page_index': pageIndex,
      'page_size': pageSize
    };
    var response =
        await HttpUtil().get(ApiUrl.CATEGORY_GOOD_LIST, params: param);
    CategoryGoodListModel model =
        CategoryGoodListModel.fromJson(response['data']);

    if (model.categoryGoodList.length > 0 && model.categoryGoodList != null) {
      goodList.addAll(model.categoryGoodList);
      this.setState(() {
        goodList = goodList;
        noMoreData = false;
      });
    } else {
      this.setState(() {
        noMoreData = true;
      });
    }
  }

  /// 商品列表项
  Widget goodListItem(List<CategoryGoodModel> list, int index) {
    return InkWell(
      onTap: () {
        RouterUtil.toGoodDetailPage(context, list[index].id.toString());
      },
      child: Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1.0, color: SColor.BORDER_COLOR),
          ),
        ),
        child: Row(
          children: [
            SizedBox(width: 10),
            goodImage(list, index),
            SizedBox(width: 10),
            Column(
              children: [
                goodName(list, index),
                goodPrice(list, index),
              ],
            )
          ],
        ),
      ),
    );
  }

  /// 商品图片
  Widget goodImage(List<CategoryGoodModel> list, int index) {
    return Container(
      width: ScreenUtil().setWidth(160),
      child: Image.network(list[index].images!.split(',')[0]),
    );
  }

  /// 商品名称
  Widget goodName(List<CategoryGoodModel> list, int index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Text(
        list[index].name!,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: ScreenUtil().setSp(28)),
      ),
    );
  }

  /// 商品价格
  Widget goodPrice(List<CategoryGoodModel> list, int index) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      width: ScreenUtil().setWidth(370),
      child: Row(
        children: [
          Text(
            SString.GOOD_LIST_PRICE + '${list[index].discount_price!}',
            style: TextStyle(color: SColor.PRICE_TEXT_COLOR),
          ),
          Text(
            '￥${list[index].price!}',
            style: SFont.PRICE_STYLE,
          ),
        ],
      ),
    );
  }
}
