import 'package:flutter/material.dart';
import 'package:flutter_shop/config/color.dart';

/// 圆形选择框 */
class CircleCheckBox extends StatefulWidget {
  bool value = false;
  Function onChanged;

  CircleCheckBox({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);
  @override
  _CircleCheckBoxState createState() => _CircleCheckBoxState();
}

class _CircleCheckBoxState extends State<CircleCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          widget.value = !widget.value;
          widget.onChanged(widget.value);
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: widget.value
              ? Icon(
                  Icons.check_circle,
                  size: 28.0,
                  color: SColor.CHECKBOX_COLOR,
                )
              : Icon(
                  Icons.panorama_fish_eye,
                  size: 28.0,
                  color: Colors.grey,
                ),
        ),
      ),
    );
  }
}
