import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/call/call.dart';
import 'package:flutter_shop/call/notify.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/utils/router_util.dart';
import 'package:flutter_shop/utils/token_util.dart';
import 'package:flutter_shop/widgets/big_button.dart';
import 'package:flutter_shop/widgets/show_message.dart';

class MemberPage extends StatefulWidget {
  MemberPage({Key? key}) : super(key: key);

  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  bool isLogin = true;
  String userName = "";

  @override
  void initState() {
    super.initState();
    Call.addCallBack(Notify.LOGIN_STATUS, this.loginCallBack);
    checkLogin();
  }

  checkLogin() async {
    bool login = await TokenUtil.isLogin();
    var userInfo = await TokenUtil.getUserInfo();
    this.setState(() {
      isLogin = login;
      userName = userInfo['username'];
    });
  }

  loginCallBack(data) {
    if (data['isLogin']) {
      this.setState(() {
        userName = data['username'];
        isLogin = true;
      });
    } else {
      userName = '';
      isLogin = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: ScreenUtil().setHeight(220.0),
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/head_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ClipOval(
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: Image.asset(
                        'assets/images/head.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                this.isLogin
                    ? Expanded(
                        flex: 1,
                        child: Text(
                          userName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                          ),
                        ))
                    : Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            RouterUtil.toLoginPage(context);
                          },
                          child: Text(
                            SString.LOGIN_OR_REGISTER,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 10,
            color: Color.fromRGBO(242, 242, 242, 0.9),
          ),
          ListTile(
            leading: Icon(
              Icons.assessment,
              color: Colors.blue,
            ),
            title: Text(SString.ALL_ORDER),
            onTap: () {
              if (isLogin) {
                /// TODO 跳转至我的订单页面
              } else {
                MessageWidget.show(SString.PLEASE_LOGIN);
              }
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.favorite,
              color: Colors.redAccent,
            ),
            title: Text(SString.MY_COLLECT),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.attach_money,
              color: Colors.redAccent,
            ),
            title: Text(SString.MY_COUPON),
          ),
          Container(
            width: double.infinity,
            height: 10,
            color: Color.fromRGBO(242, 242, 242, 0.9),
          ),
          ListTile(
            leading: Icon(
              Icons.phone_in_talk,
              color: Colors.green,
            ),
            title: Text(SString.ONLINE_SERVICE),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.black54,
            ),
            title: Text(SString.ABOUT_US),
          ),
          Divider(),
          SizedBox(height: 60),
          this.isLogin
              ? BigButton(
                  text: SString.LOGOUT_TITLE,
                  onPressed: () {
                    TokenUtil.clearUserInfo();
                    this.setState(() {
                      isLogin = false;
                      userName = '';
                    });
                    var data = {
                      "username": '',
                      'isLogin': false,
                    };
                    Call.dispath(Notify.LOGIN_STATUS, data: data);
                    RouterUtil.toLoginPage(context);
                  },
                )
              : Container(),
        ],
      ),
    );
  }
}
