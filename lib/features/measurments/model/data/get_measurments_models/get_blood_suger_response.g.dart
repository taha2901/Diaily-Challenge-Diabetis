// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_blood_suger_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SugarMeasurement _$SugarMeasurementFromJson(Map<String, dynamic> json) =>
    SugarMeasurement(
      userId: json['user_Id'] as String,
      dateTime: json['dateTime'] as String,
      measurementDate: json['measurement_date'] as String,
      sugarReading: (json['sugar_reading'] as num).toInt(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$SugarMeasurementToJson(SugarMeasurement instance) =>
    <String, dynamic>{
      'user_Id': instance.userId,
      'dateTime': instance.dateTime,
      'measurement_date': instance.measurementDate,
      'sugar_reading': instance.sugarReading,
      'status': instance.status,
    };
