// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_pressure_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BloodPressureResponseBody _$BloodPressureResponseBodyFromJson(
  Map<String, dynamic> json,
) => BloodPressureResponseBody(
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : BloodPressureData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BloodPressureResponseBodyToJson(
  BloodPressureResponseBody instance,
) => <String, dynamic>{'message': instance.message, 'data': instance.data};

BloodPressureData _$BloodPressureDataFromJson(Map<String, dynamic> json) =>
    BloodPressureData(
      id: (json['id'] as num?)?.toInt(),
      diastolicPressure: (json['diastolic_pressure'] as num?)?.toInt(),
      systolicPressure: (json['systolic_pressure'] as num?)?.toInt(),
      heartRate: (json['heart_rate'] as num?)?.toInt(),
      dateTime: json['dateTime'] as String?,
      user: json['user'] as String?,
      userId: json['user_Id'] as String?,
    );

Map<String, dynamic> _$BloodPressureDataToJson(BloodPressureData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'diastolic_pressure': instance.diastolicPressure,
      'systolic_pressure': instance.systolicPressure,
      'heart_rate': instance.heartRate,
      'dateTime': instance.dateTime,
      'user': instance.user,
      'user_Id': instance.userId,
    };
