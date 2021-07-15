import 'package:flutter/material.dart';

/// 输入框组件 */
class ItemTextField extends StatelessWidget {
  Icon icon;
  TextEditingController controller; // 文本编辑器
  FocusNode focusNode;
  String title;
  String hintText;
  bool obscureText; //是否为安全框

  ItemTextField({
    Key? key,
    required this.icon,
    required this.controller,
    required this.focusNode,
    required this.title,
    required this.hintText,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 18,
            top: 8,
            width: 18,
            height: 14,
            child: icon,
          ),
          Positioned(
            left: 55,
            right: 10,
            top: 10,
            height: 32,
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 14,
              ),
              obscureText: obscureText,
            ),
          ),
        ],
      ),
    );
  }
}
