import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 弹出消息组件 */
class MessageWidget {
  static show(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        textColor: Colors.white,
        fontSize: 14.0,
        backgroundColor: Colors.grey);
  }
}
