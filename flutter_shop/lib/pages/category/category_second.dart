import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/call/call.dart';
import 'package:flutter_shop/call/notify.dart';
import 'package:flutter_shop/config/api_url.dart';
import 'package:flutter_shop/model/category_model.dart';
import 'package:flutter_shop/services/http_service.dart';
import 'package:flutter_shop/utils/http_util.dart';
import 'package:flutter_shop/utils/router_util.dart';

class CategorySecond extends StatefulWidget {
  CategorySecond({Key? key}) : super(key: key);

  @override
  _CategorySecondState createState() => _CategorySecondState();
}

class _CategorySecondState extends State<CategorySecond> {
  List<CategoryModel> secondList = [];
  int firstCategoryId = 0;
  int secondCategoryId = 0;

  @override
  void initState() {
    super.initState();
    Call.addCallBack(Notify.REFRESH_SECOND_CATEGORY, this.refreshCategory);
  }

  refreshCategory(data) {
    this.setState(() {
      firstCategoryId = data['firstCategoryId'];
    });
    this.getFirstCategory(data['firstCategoryId']);
  }

  getFirstCategory(int id) async {
    var response = await HttpUtil().get(ApiUrl.CATEGORY_SECOND,
        params: {
          'pid': id,
        },
        isShowLoad: true);
    CategoryListModel model = CategoryListModel.fromJson(response["data"]);
    if (model.categoryList!.isNotEmpty) {
      var secondId = model.categoryList?[0].id;
      setState(() {
        secondList = model.categoryList ?? [];
        secondCategoryId = secondId ?? 0;
      });
    } else {
      this.setState(() {
        secondList = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: secondList.length > 0
          ? Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 20.0)),
                GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: secondList.length,
                    shrinkWrap: true, //GridView 被嵌套在其他组件中时设置为true
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 1.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return categoryItem(secondList[index]);
                    }),
                Padding(padding: EdgeInsets.only(top: 10.0)),
              ],
            )
          : Center(child: Text("暂无数据")),
    );
  }

  /// 分类组件项
  Widget categoryItem(CategoryModel categoryModel) {
    return GestureDetector(
      onTap: () {
        this.setState(() {
          secondCategoryId = categoryModel.id!;
        });

        RouterUtil.toCategoryGoodListPage(
            context, firstCategoryId, secondCategoryId);
      },
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Image.network(
              categoryModel.image!,
              fit: BoxFit.cover,
              height: 60,
            ),
            Text(
              categoryModel.name!,
              style: TextStyle(fontSize: 14.0, color: Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}
