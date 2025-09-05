// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationRequestBody _$ReservationRequestBodyFromJson(
  Map<String, dynamic> json,
) => ReservationRequestBody(
  username: json['username'] as String,
  phone: json['phone'] as String,
  age: (json['age'] as num).toInt(),
  sex: json['sex'] as String,
  date: json['date'] as String,
  time: json['time'] as String,
);

Map<String, dynamic> _$ReservationRequestBodyToJson(
  ReservationRequestBody instance,
) => <String, dynamic>{
  'username': instance.username,
  'phone': instance.phone,
  'age': instance.age,
  'sex': instance.sex,
  'date': instance.date,
  'time': instance.time,
};
