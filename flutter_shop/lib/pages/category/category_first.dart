import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/call/call.dart';
import 'package:flutter_shop/call/notify.dart';
import 'package:flutter_shop/config/api_url.dart';
import 'package:flutter_shop/config/color.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/model/category_model.dart';
import 'package:flutter_shop/services/http_service.dart';
import 'package:flutter_shop/utils/http_util.dart';

class CategoryFirst extends StatefulWidget {
  CategoryFirst({Key? key}) : super(key: key);

  @override
  _CategoryFirstState createState() => _CategoryFirstState();
}

class _CategoryFirstState extends State<CategoryFirst> {
  List<CategoryModel> firstList = [];
  int firstCategoryId = 0;
  @override
  void initState() {
    super.initState();
    getFirstCategory();
  }

  getFirstCategory() async {
    var response = await HttpUtil().get(ApiUrl.CATEGORY_FIRST);
    CategoryListModel model = CategoryListModel.fromJson(response["data"]);
    this.setState(() {
      firstList = model.categoryList ?? [];
      firstCategoryId = model.categoryList?[0].id ?? 0; //默认显示第一条数据
    });

    // 刷新一级菜单选中的页面
    Call.dispath(
      Notify.REFRESH_SECOND_CATEGORY,
      data: {'firstCategoryId': firstCategoryId},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(150),
      color: Colors.white,
      child: firstList.length > 0
          ? ListView.builder(
              itemCount: firstList.length,
              itemBuilder: (context, index) {
                return categoryItem(firstList, index);
              },
            )
          : Center(child: Text("暂无数据")),
    );
  }

  /// 分类列表项
  Widget categoryItem(List<CategoryModel> list, int index) {
    bool isSelected = (list[index].id == firstCategoryId);
    return InkWell(
      onTap: () async {
        this.setState(() {
          firstCategoryId = list[index].id!;
        });
        // 刷新一级菜单选中的页面
        Call.dispath(
          Notify.REFRESH_SECOND_CATEGORY,
          data: {'firstCategoryId': firstCategoryId},
        );
      },
      child: Container(
        height: ScreenUtil().setHeight(80),
        padding: EdgeInsets.only(left: 10, top: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: isSelected ? SColor.PRIMARY_COLOR : Colors.grey.shade200,
            ),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          list[index].name!,
          style: TextStyle(
            color: isSelected ? SColor.PRIMARY_COLOR : Colors.black,
            fontSize: ScreenUtil().setSp(28),
          ),
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}
