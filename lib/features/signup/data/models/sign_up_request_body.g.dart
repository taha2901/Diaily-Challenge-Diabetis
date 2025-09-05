// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestBody _$RegisterRequestBodyFromJson(Map<String, dynamic> json) =>
    RegisterRequestBody(
      email: json['Email'] as String,
      password: json['Password'] as String,
      name: json['Username'] as String,
      phone: json['Phone'] as String,
      photo: json['Photo'] as String,
      address: json['Address'] as String,
    );

Map<String, dynamic> _$RegisterRequestBodyToJson(
  RegisterRequestBody instance,
) => <String, dynamic>{
  'Username': instance.name,
  'Email': instance.email,
  'Phone': instance.phone,
  'Password': instance.password,
  'Address': instance.address,
  'Photo': instance.photo,
};
