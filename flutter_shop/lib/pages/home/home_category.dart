import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/home_content_model.dart';
import 'package:flutter_shop/utils/router_util.dart';

class HomeCategory extends StatelessWidget {
  List<HomeCategoryModel> categories;
  HomeCategory({Key? key, required this.categories}) : super(key: key);

  /// 分类组件项
  Widget categoryItem(BuildContext context, HomeCategoryModel item) {
    return InkWell(
      onTap: () {
        RouterUtil.toCategoryGoodListPage(context, item.id!, 0);
      },
      child: Column(
        children: [
          Image.network(
            item.image!,
            width: ScreenUtil().setWidth(95),
          ),
          Text(item.name!),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (categories.length > 10) {
      categories.removeRange(10, categories.length);
    }

    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 10.0),
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(3.0),
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          padding: EdgeInsets.all(4.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            mainAxisSpacing: ScreenUtil().setWidth(10.0),
            crossAxisSpacing: ScreenUtil().setWidth(10.0),
          ),
          itemBuilder: (BuildContext context, int index) {
            return categoryItem(context, categories[index]);
          }),
    );
  }
}
