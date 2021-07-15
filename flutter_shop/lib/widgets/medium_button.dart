import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 中等按钮 */
class MediumButton extends StatelessWidget {
  String text;
  Color color;
  Function onPressed;

  MediumButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(300),
      height: ScreenUtil().setHeight(70),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        onPressed: () {
          this.onPressed();
        },
        color: this.color,
        child: Text(
          this.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil().setHeight(28),
          ),
        ),
      ),
    );
  }
}
