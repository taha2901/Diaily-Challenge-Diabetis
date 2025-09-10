// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_blood_pressure_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BloodPressureMeasurement _$BloodPressureMeasurementFromJson(
  Map<String, dynamic> json,
) => BloodPressureMeasurement(
  userId: json['user_Id'] as String,
  dateTime: DateTime.parse(json['dateTime'] as String),
  systolicPressure: (json['systolic_pressure'] as num).toInt(),
  diastolicPressure: (json['diastolic_pressure'] as num).toInt(),
  heartRate: (json['heart_rate'] as num).toInt(),
  status: json['status'] as String,
);

Map<String, dynamic> _$BloodPressureMeasurementToJson(
  BloodPressureMeasurement instance,
) => <String, dynamic>{
  'user_Id': instance.userId,
  'dateTime': instance.dateTime.toIso8601String(),
  'systolic_pressure': instance.systolicPressure,
  'diastolic_pressure': instance.diastolicPressure,
  'heart_rate': instance.heartRate,
  'status': instance.status,
};
