// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_suger_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BloodSugerRequestBody _$BloodSugerRequestBodyFromJson(
  Map<String, dynamic> json,
) => BloodSugerRequestBody(
  sugarReading: (json['sugar_reading'] as num).toInt(),
  measurementDate: json['measurement_date'] as String,
  dateTime: DateTime.parse(json['dateTime'] as String),
);

Map<String, dynamic> _$BloodSugerRequestBodyToJson(
  BloodSugerRequestBody instance,
) => <String, dynamic>{
  'sugar_reading': instance.sugarReading,
  'measurement_date': instance.measurementDate,
  'dateTime': instance.dateTime.toIso8601String(),
};
