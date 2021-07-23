// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    id: json['id'] as int?,
    token: json['token'] as String?,
    username: json['username'] as String?,
  )
    ..mobile = json['mobile'] as String?
    ..head_image = json['head_image'] as String?
    ..address = json['address'] as String?;
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
      'username': instance.username,
      'mobile': instance.mobile,
      'head_image': instance.head_image,
      'address': instance.address,
    };
