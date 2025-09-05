// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_pressure_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BloodPressureRequestBody _$BloodPressureRequestBodyFromJson(
  Map<String, dynamic> json,
) => BloodPressureRequestBody(
  diastolicPressure: (json['diastolic_pressure'] as num).toInt(),
  systolicPressure: (json['systolic_pressure'] as num).toInt(),
  heartRate: (json['heart_rate'] as num).toInt(),
  dateTime: DateTime.parse(json['dateTime'] as String),
);

Map<String, dynamic> _$BloodPressureRequestBodyToJson(
  BloodPressureRequestBody instance,
) => <String, dynamic>{
  'diastolic_pressure': instance.diastolicPressure,
  'systolic_pressure': instance.systolicPressure,
  'heart_rate': instance.heartRate,
  'dateTime': instance.dateTime.toIso8601String(),
};
