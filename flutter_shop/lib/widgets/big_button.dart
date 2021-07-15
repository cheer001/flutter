import 'package:flutter/material.dart';
import 'package:flutter_shop/config/color.dart';

/// 大按钮 */
class BigButton extends StatelessWidget {
  String text;
  Function onPressed;

  BigButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      padding: EdgeInsets.all(0.0),
      width: MediaQuery.of(context).size.width - 20,
      height: 48,
      child: RaisedButton(
        onPressed: () {
          this.onPressed();
        },
        child: Text(this.text),
        color: SColor.PRIMARY_COLOR,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
