// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseBody _$LoginResponseBodyFromJson(Map<String, dynamic> json) =>
    LoginResponseBody(
      message: json['message'] as String?,
      isAuthenticated: json['isAuthenticated'] as bool?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      token: json['token'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$LoginResponseBodyToJson(LoginResponseBody instance) =>
    <String, dynamic>{
      'message': instance.message,
      'isAuthenticated': instance.isAuthenticated,
      'username': instance.username,
      'email': instance.email,
      'token': instance.token,
      'phone': instance.phone,
    };
