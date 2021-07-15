import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/home_content_model.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

class HomeBanner extends StatelessWidget {
  List<HomeBannerModel> banners;
  HomeBanner({Key? key, required this.banners}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: new Swiper(
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            child: Image.network(
              '${banners[index].image}',
              fit: BoxFit.cover,
            ),
          );
        },
        autoplay: true,
        itemCount: banners.length,
        pagination: SwiperPagination(),
        // control: SwiperControl(),
      ),
    );
  }
}
