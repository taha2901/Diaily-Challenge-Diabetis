// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorResponseBody _$DoctorResponseBodyFromJson(Map<String, dynamic> json) =>
    DoctorResponseBody(
      id: (json['id'] as num).toInt(),
      userName: json['userName'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      address: json['address'] as String,
      workingDays: (json['workingDays'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      detectionPrice: (json['detectionPrice'] as num).toInt(),
      doctorspecialization: json['doctorspecialization'] as String,
      photo: json['photo'] as String,
      about: json['about'] as String,
      waitingTime: json['waitingTime'] as String,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      favorite: json['favorite'] as bool,
      users: json['users'] as List<dynamic>,
      doctorComments: json['doctorComments'] as List<dynamic>,
      workingHours: (json['workingHours'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      rate: (json['rate'] as num?)?.toInt(),
      rateCount: (json['rateCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DoctorResponseBodyToJson(DoctorResponseBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'phone': instance.phone,
      'email': instance.email,
      'password': instance.password,
      'address': instance.address,
      'workingDays': instance.workingDays,
      'detectionPrice': instance.detectionPrice,
      'doctorspecialization': instance.doctorspecialization,
      'photo': instance.photo,
      'about': instance.about,
      'waitingTime': instance.waitingTime,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'favorite': instance.favorite,
      'rate': instance.rate,
      'rateCount': instance.rateCount,
      'users': instance.users,
      'doctorComments': instance.doctorComments,
      'workingHours': instance.workingHours,
    };
