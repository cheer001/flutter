import 'dart:convert';

import 'package:flutter_shop/model/user_model.dart';
import 'package:localstorage/localstorage.dart';

class StorageUtil {
  static final StorageUtil _singleton = new StorageUtil._internal();
  late LocalStorage storage;

  factory StorageUtil() => _singleton;

  StorageUtil._internal() {
    storage = new LocalStorage('flutter_shop');
  }

  Future<void> saveLoginInfo(UserModel userModel) async {
    await storage.setItem("userInfo", jsonEncode(userModel));
  }

  Map<String, dynamic> getUserInfo() {
    var userInfo = storage.getItem('userInfo');
    String username = userInfo.username;
    int id = userInfo.id;
    String mobile = userInfo.mobile;
    String address = userInfo.address;

    return {
      'username': username,
      'id': id,
      'mobile': mobile,
      'address': address,
    };
  }

  Future<void> setToken(String token) async {
    await storage.setItem('token', token != null && token != "" ? token : "");
  }

  String getToken() {
    return storage.getItem('token');
  }
}
