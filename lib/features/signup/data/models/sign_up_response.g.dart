// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponseBody _$RegisterResponseBodyFromJson(
  Map<String, dynamic> json,
) => RegisterResponseBody(
  message: json['message'] as String?,
  isAuthenticated: json['isAuthenticated'] as bool?,
  username: json['username'] as String?,
  email: json['email'] as String?,
  token: json['token'] as String?,
  phone: json['phone'] as String?,
  photoUrl: json['photoUrl'] as String?,
);

Map<String, dynamic> _$RegisterResponseBodyToJson(
  RegisterResponseBody instance,
) => <String, dynamic>{
  'message': instance.message,
  'isAuthenticated': instance.isAuthenticated,
  'username': instance.username,
  'email': instance.email,
  'photoUrl': instance.photoUrl,
  'token': instance.token,
  'phone': instance.phone,
};
