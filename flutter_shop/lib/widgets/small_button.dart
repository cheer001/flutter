import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/config/color.dart';

/// 小按钮 */
class SmallButton extends StatelessWidget {
  String text;
  Function onPressed;

  SmallButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(160),
      height: 50,
      child: InkWell(
        onTap: () {
          this.onPressed();
        },
        child: Container(
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: ShopColor.BUY_BUTTON_COLOR,
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: Text(
            this.text,
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}
