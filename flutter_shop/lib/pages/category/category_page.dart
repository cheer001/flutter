import 'package:flutter/material.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/pages/category/category_first.dart';
import 'package:flutter_shop/pages/category/category_second.dart';

/// 主页面
class CategoryPage extends StatefulWidget {
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextString.CATEGORY_TITLE),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          children: [CategoryFirst(), Expanded(child: CategorySecond())],
        ),
      ),
    );
  }
}
