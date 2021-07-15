import 'package:flutter/material.dart';

/// 主页面
class CartPage extends StatefulWidget {
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("购物车"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("购物车"),
      ),
    );
  }
}
