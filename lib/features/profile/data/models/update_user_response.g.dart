// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserResponse _$UpdateUserResponseFromJson(Map<String, dynamic> json) =>
    UpdateUserResponse(
      message: json['message'] as String,
      date: User.fromJson(json['date'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateUserResponseToJson(UpdateUserResponse instance) =>
    <String, dynamic>{'message': instance.message, 'date': instance.date};

User _$UserFromJson(Map<String, dynamic> json) => User(
  userName: json['userName'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'userName': instance.userName,
  'email': instance.email,
  'phone': instance.phone,
};
