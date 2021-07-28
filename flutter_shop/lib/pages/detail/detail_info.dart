import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/model/good_detail_model.dart';

class DetailInfo extends StatefulWidget {
  GoodDetailModel? goodDetailModel;
  DetailInfo({Key? key, required this.goodDetailModel}) : super(key: key);

  @override
  _DetailInfoState createState() => _DetailInfoState();
}

class _DetailInfoState extends State<DetailInfo> {
  @override
  Widget build(BuildContext context) {
    return widget.goodDetailModel != null
        ? Container(
            color: Colors.white,
            padding: EdgeInsets.all(2.0),
            child: Column(
              children: [
                goodImage(widget.goodDetailModel!.images!.split(',')[0]),
                goodName(widget.goodDetailModel!.name),
                goodSN(widget.goodDetailModel!.good_sn),
                goodPrice(widget.goodDetailModel!.discount_price!,
                    widget.goodDetailModel!.price!)
              ],
            ),
          )
        : Center(
            child: Text('暂无图片'),
          );
  }

  Widget goodImage(url) {
    return Image.network(
      url,
      width: ScreenUtil().setWidth(740),
    );
  }

  Widget goodName(name) {
    return Container(
      width: ScreenUtil().setWidth(740),
      padding: EdgeInsets.only(left: 15.0),
      child: Text(
        name,
        maxLines: 1,
        style: TextStyle(fontSize: ScreenUtil().setSp(30)),
      ),
    );
  }

  Widget goodSN(num) {
    return Container(
      width: ScreenUtil().setWidth(740),
      padding: EdgeInsets.only(left: 15.0),
      margin: EdgeInsets.only(top: 8.0),
      child: Text(
        SString.GOOD_SN,
        maxLines: 1,
        style: TextStyle(color: SColor.GOOD_SN_COLOR),
      ),
    );
  }

  Widget goodPrice(int discountPrice, int price) {
    return Container(
      width: ScreenUtil().setWidth(740),
      padding: EdgeInsets.only(left: 15.0),
      margin: EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          Text(
            '￥$discountPrice',
            style: TextStyle(
                color: SColor.PRICE_TEXT_COLOR,
                fontSize: ScreenUtil().setSp(40)),
          ),
          SizedBox(width: 5),
          Text(
            SString.ORI_PRICE + '$price',
            style: TextStyle(
              color: SColor.OLD_PRICE_COLOR,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
    );
  }
}
