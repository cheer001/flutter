import 'package:flutter_shop/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenUtil {
  static Future<bool> isLogin() async {
    String token = "";
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token = preferences.getString("token") ?? "";
    if (token == "") {
      return false;
    }
    return true;
  }

  static Future<String> getToken() async {
    String token = "";
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token = preferences.getString("token") ?? "";
    return token;
  }

  static Future<Map<String, dynamic>> getUserInfo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String username = preferences.getString("username") ?? "";
    int id = preferences.getInt("id") ?? 0;
    String mobile = preferences.getString("mobile") ?? "";
    String address = preferences.getString("address") ?? "";

    return {
      'username': username,
      'id': id,
      'mobile': mobile,
      'address': address,
    };
  }

  static saveLoginInfo(UserModel userModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('token', userModel.token!);
    await preferences.setString('username', userModel.username!);
    await preferences.setInt('id', userModel.id!);
    await preferences.setString('head_image', userModel.head_image!);
    await preferences.setString('mobile', userModel.mobile!);
    await preferences.setString('address', userModel.address!);
  }

  static clearUserInfo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('token', "");
    await preferences.setString('username', "");
    await preferences.setInt('id', 0);
    await preferences.setString('head_image', "");
    await preferences.setString('mobile', "");
    await preferences.setString('address', "");
  }
}
