import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  const UserModel({
    this.firstname,
    this.lastname,
    this.username,
    this.email,
    this.gender,
    this.image,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @JsonKey(name: 'firstName')
  final String? firstname;

  @JsonKey(name: 'lastName')
  final String? lastname;

  @JsonKey(name: 'username')
  final String? username;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'gender')
  final String? gender;

  @JsonKey(name: 'image')
  final String? image;

  @JsonKey(name: 'token')
  final String? token;
}
