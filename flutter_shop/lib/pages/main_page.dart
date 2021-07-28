import 'package:flutter/material.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/pages/home/home_page.dart';
import 'package:flutter_shop/pages/cart/cart_page.dart';
import 'package:flutter_shop/pages/category/category_page.dart';
import 'package:flutter_shop/pages/user/member_page.dart';

/// 主页面
class MainPage extends StatefulWidget {
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  List<BottomNavigationBarItem> _tabs = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: TextString.HOME_TITLE,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.category),
      label: TextString.CATEGORY_TITLE,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: TextString.CART_TITLE,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: TextString.MENMBER_TITLE,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _tabs,
        currentIndex: _currentIndex,
        onTap: (index) {
          this.setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomePage(),
          CategoryPage(),
          CartPage(),
          MemberPage(),
        ],
      ),
    );
  }
}
