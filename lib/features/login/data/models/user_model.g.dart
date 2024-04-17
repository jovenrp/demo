// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      firstname: json['firstName'] as String?,
      lastname: json['lastName'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      image: json['image'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'firstName': instance.firstname,
      'lastName': instance.lastname,
      'username': instance.username,
      'email': instance.email,
      'gender': instance.gender,
      'image': instance.image,
      'token': instance.token,
    };
