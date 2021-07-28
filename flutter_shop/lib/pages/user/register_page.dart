import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/call/call.dart';
import 'package:flutter_shop/call/notify.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/model/user_model.dart';
import 'package:flutter_shop/services/http_service.dart';
import 'package:flutter_shop/utils/http_util.dart';
import 'package:flutter_shop/utils/router_util.dart';
import 'package:flutter_shop/utils/token_util.dart';
import 'package:flutter_shop/widgets/big_button.dart';
import 'package:flutter_shop/widgets/item_text_field.dart';
import 'package:flutter_shop/widgets/logo_container.dart';
import 'package:flutter_shop/widgets/show_message.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController userNameController;
  late TextEditingController pwdController;
  late TextEditingController mobileController;
  late TextEditingController addressController;
  FocusNode userNameNode = FocusNode();
  FocusNode pwdNode = FocusNode();
  FocusNode mobileNode = FocusNode();
  FocusNode addressNode = FocusNode();

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    pwdController = TextEditingController();
    mobileController = TextEditingController();
    addressController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ShopColor.PRIMARY_COLOR,
        elevation: 0,
        title: Text(TextString.REGISTER_TITLE),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LogoContainer(),
            SizedBox(height: 30),
            registerContent(context)
          ],
        ),
      ),
    );
  }

  /// 输入框区域组件
  Widget registerContent(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          itemTitle(TextString.USER_NAME),
          SizedBox(height: 5.0),
          ItemTextField(
            icon: Icon(Icons.person),
            controller: userNameController,
            focusNode: userNameNode,
            title: TextString.USERNAME,
            hintText: TextString.PLEASE_INPUT_NAME,
            obscureText: false,
          ),
          SizedBox(height: 10.0),
          itemTitle(TextString.MOBILE),
          SizedBox(height: 5.0),
          ItemTextField(
            icon: Icon(Icons.phone),
            controller: mobileController,
            focusNode: mobileNode,
            title: TextString.MOBILE,
            hintText: TextString.PLEASE_INPUT_MOBILE,
            obscureText: false,
          ),
          SizedBox(height: 10.0),
          itemTitle(TextString.PASSWORD),
          SizedBox(height: 5.0),
          ItemTextField(
            icon: Icon(Icons.lock),
            controller: pwdController,
            focusNode: pwdNode,
            title: TextString.PASSWORD,
            hintText: TextString.PLEASE_INPUT_PWD,
            obscureText: true,
          ),
          SizedBox(height: 10.0),
          itemTitle(TextString.ADDRESS),
          SizedBox(height: 5.0),
          ItemTextField(
            icon: Icon(Icons.home),
            controller: addressController,
            focusNode: addressNode,
            title: TextString.ADDRESS,
            hintText: TextString.PLEASE_INPUT_ADDRESS,
            obscureText: false,
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(top: 10.0, right: 30.0),
            child: InkWell(
              onTap: () {
                RouterUtil.toLoginPage(context);
              },
              child: Text(
                "去登录",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          BigButton(
              text: TextString.REGISTER_TITLE,
              onPressed: () {
                if (checkInput()) {
                  this.register();
                }
              })
        ],
      ),
    );
  }

  Widget itemTitle(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
      ),
    );
  }

  /// 检查输入操作
  bool checkInput() {
    if (userNameController.text.length == 0) {
      MessageWidget.show(TextString.PLEASE_INPUT_NAME);
      return false;
    } else if (mobileController.text.length == 0) {
      MessageWidget.show(TextString.PLEASE_INPUT_MOBILE);
      return false;
    } else if (pwdController.text.length == 0) {
      MessageWidget.show(TextString.PLEASE_INPUT_PWD);
      return false;
    } else if (addressController.text.length == 0) {
      MessageWidget.show(TextString.ADDRESS);
      return false;
    }
    return true;
  }

  register() async {
    var formData = {
      'username': userNameController.text.toString().trim(),
      'mobile': mobileController.text.toString().trim(),
      'password': pwdController.text.toString().trim(),
      'address': addressController.text.toString().trim(),
    };

    var response =
        await HttpUtil().post(ApiUrl.USER_REGISTER, params: formData);
    if (response.data['code'] == 0) {
      UserModel model = UserModel.fromJson(response['data']);
      MessageWidget.show(TextString.REGISTER_SUCCESS);
      userNameController.text = "";
      mobileController.text = "";
      pwdController.text = "";
      addressController.text = "";
    } else {
      MessageWidget.show(TextString.REGISTER_FAILED);
    }
  }
}
