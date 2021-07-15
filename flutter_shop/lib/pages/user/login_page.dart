import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/call/call.dart';
import 'package:flutter_shop/call/notify.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/model/user_model.dart';
import 'package:flutter_shop/services/http_service.dart';
import 'package:flutter_shop/utils/router_util.dart';
import 'package:flutter_shop/utils/storage_util.dart';
import 'package:flutter_shop/utils/token_util.dart';
// import 'package:flutter_shop/utils/token_util.dart';
import 'package:flutter_shop/widgets/big_button.dart';
import 'package:flutter_shop/widgets/item_text_field.dart';
import 'package:flutter_shop/widgets/logo_container.dart';
import 'package:flutter_shop/widgets/show_message.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? userNameController;
  TextEditingController? pwdController;
  FocusNode userNameNode = FocusNode();
  FocusNode pwdNode = FocusNode();

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    pwdController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SColor.PRIMARY_COLOR,
        elevation: 0,
        title: Text(SString.LOGIN_TITLE),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LogoContainer(),
            SizedBox(height: 150),
            textInputContent(context)
          ],
        ),
      ),
    );
  }

  /// 输入框区域组件
  Widget textInputContent(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          ItemTextField(
            icon: Icon(Icons.person),
            controller: userNameController!,
            focusNode: userNameNode,
            title: SString.USERNAME,
            hintText: SString.PLEASE_INPUT_NAME,
            obscureText: false,
          ),
          SizedBox(height: 20.0),
          ItemTextField(
            icon: Icon(Icons.lock),
            controller: pwdController!,
            focusNode: pwdNode,
            title: SString.PASSWORD,
            hintText: SString.PLEASE_INPUT_PWD,
            obscureText: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              forgetPasswordButton(),
              registerButton(),
            ],
          ),
          SizedBox(height: 50.0),
          BigButton(
              text: SString.LOGIN_TITLE,
              onPressed: () {
                if (checkInput()) {
                  this.login();
                }
              })
        ],
      ),
    );
  }

  /// 忘记密码
  Widget forgetPasswordButton() {
    return Container(
      margin: EdgeInsets.all(
        ScreenUtil().setWidth(40.0),
      ),
      child: InkWell(
        child: Text(
          SString.FORGET_PASSWORD,
          style: TextStyle(
              color: Colors.black, fontSize: ScreenUtil().setSp(28.0)),
        ),
      ),
    );
  }

  /// 注册按钮
  Widget registerButton() {
    return Container(
      margin: EdgeInsets.all(
        ScreenUtil().setWidth(40.0),
      ),
      child: InkWell(
        onTap: () {
          RouterUtil.toRegisterPage(context);
        },
        child: Text(
          SString.FAST_REGISTER,
          style:
              TextStyle(color: Colors.blue, fontSize: ScreenUtil().setSp(28.0)),
        ),
      ),
    );
  }

  /// 检查输入操作
  bool checkInput() {
    if (userNameController?.text.length == 0) {
      MessageWidget.show(SString.PLEASE_INPUT_NAME);
      return false;
    } else if (pwdController?.text.length == 0) {
      MessageWidget.show(SString.PLEASE_INPUT_PWD);
      return false;
    }
    return true;
  }

  login() async {
    var formData = {
      'username': userNameController?.text.toString().trim(),
      'password': pwdController?.text.toString().trim(),
    };
    print(formData);
    var response = await Dio(BaseOptions(baseUrl: ApiUrl.URL_HEAD)).post(
      ApiUrl.USER_LOGIN,
      data: formData,
    );
    print(response.data['code']);
    if (response.data['code'] == 0) {
      UserModel model = UserModel.fromJson(response.data['data']);
      MessageWidget.show(SString.LOGIN_SUCCESS);
      await TokenUtil.saveLoginInfo(model);
      var data = {
        'username': model.username,
        'isLogin': true,
      };
      Call.dispath(Notify.LOGIN_STATUS, data: data);
      RouterUtil.pop(context);
    } else {
      MessageWidget.show(SString.LOGIN_FAILED);
      var data = {
        'username': '',
        'isLogin': false,
      };
      Call.dispath(Notify.LOGIN_STATUS, data: data);
    }
  }
}
