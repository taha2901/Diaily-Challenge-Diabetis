// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailsResponse _$UserDetailsResponseFromJson(Map<String, dynamic> json) =>
    UserDetailsResponse(
      username: json['username'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      photoUrl: json['photoUrl'] as String?,
      address: json['address'],
    );

Map<String, dynamic> _$UserDetailsResponseToJson(
  UserDetailsResponse instance,
) => <String, dynamic>{
  'username': instance.username,
  'email': instance.email,
  'phone': instance.phone,
  'photoUrl': instance.photoUrl,
  'address': instance.address,
};
