import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

/// 用户数据模型
@JsonSerializable()
class UserModel {
  //Id
  int? id;
  //Token值
  String? token;
  //用户名
  String? username;
  //手机号
  String? mobile;
  //用户头像
  String? head_image;
  //用户地址
  String? address;

  ///构造函数
  UserModel({
    required this.id,
    required this.token,
    required this.username,
  });

  ///取Json数据
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  ///将数据转成Json
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
