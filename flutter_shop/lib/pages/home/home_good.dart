import 'package:flutter/material.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/model/home_content_model.dart';
import 'package:flutter_shop/utils/color_util.dart';
import 'package:flutter_shop/utils/router_util.dart';

class HomeGood extends StatefulWidget {
  List<HomeGoodModel> goods;
  HomeGood({Key? key, required this.goods}) : super(key: key);

  @override
  _HomeGoodState createState() => _HomeGoodState();
}

class _HomeGoodState extends State<HomeGood> {
  /// 商品组件列表
  Widget goodList(BuildContext context, double deviceWidth,
      List<HomeGoodModel> productList) {
    double itemWidth = deviceWidth * 168.5 / 360;
    double imageWidth = deviceWidth * 110.0 / 360;

    List<Widget> listWidget = productList.map((item) {
      print(item);
      var bgColor = ColorUtil.string2Color('#f8f8f8');
      return item != null
          ? InkWell(
              onTap: () {
                RouterUtil.toGoodDetailPage(context, item.id.toString());
              },
              child: Container(
                width: itemWidth,
                margin: EdgeInsets.only(bottom: 5, left: 2),
                padding: EdgeInsets.only(top: 10, left: 13, bottom: 7),
                color: bgColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        item.name!.length > 8
                            ? item.name!.substring(0, 8)
                            : item.name!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Text(
                      item.name!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      alignment: Alignment(0, 0),
                      margin: EdgeInsets.only(top: 5),
                      child: Image.network(
                        item.images!.split(',')[0],
                        width: imageWidth,
                        height: imageWidth,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '￥${item.discount_price}',
                          style: TextStyle(
                            color: SColor.PRICE_TEXT_COLOR,
                          ),
                        ),
                        SizedBox(width: 7),
                        Text(
                          '￥${item.price}',
                          style: SFont.PRICE_STYLE,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : Container(
              child: Text("暂无数据"),
            );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          alignment: Alignment.center,
          child: Text(
            SString.NEW_GOOD_TITLE,
            style: TextStyle(color: SColor.HOME_SUB_TITLE_COLOR),
          ),
        ),
        Wrap(
          spacing: 2,
          children: listWidget,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      color: Colors.white,
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 7.5),
      child: goodList(context, width, this.widget.goods),
    );
  }
}
