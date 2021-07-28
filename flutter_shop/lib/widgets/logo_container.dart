import 'package:flutter/material.dart';
import 'package:flutter_shop/config/color.dart';
import 'package:flutter_shop/config/index.dart';

/// logo */
class LogoContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = 130.0;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height,
      // color: Colors.grey[300],
      color: ShopColor.PRIMARY_COLOR,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: (width - 90) / 2,
            top: height - 45,
            child: Container(
              width: 90.0,
              height: 90.0,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).cardColor,
                    blurRadius: 3.0,
                  )
                ],
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/head.jpeg")),
              ),
            ),
          )
        ],
      ),
    );
  }
}
