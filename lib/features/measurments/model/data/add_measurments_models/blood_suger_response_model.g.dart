// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_suger_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BloodSugerResponseBody _$BloodSugerResponseBodyFromJson(
  Map<String, dynamic> json,
) => BloodSugerResponseBody(
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : SugarReadingData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BloodSugerResponseBodyToJson(
  BloodSugerResponseBody instance,
) => <String, dynamic>{'message': instance.message, 'data': instance.data};

SugarReadingData _$SugarReadingDataFromJson(Map<String, dynamic> json) =>
    SugarReadingData(
      id: (json['id'] as num?)?.toInt(),
      sugarReading: (json['sugar_reading'] as num?)?.toInt(),
      measurementDate: json['measurement_date'] as String?,
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
      user: json['user'] as String?,
      userId: json['user_Id'] as String?,
    );

Map<String, dynamic> _$SugarReadingDataToJson(SugarReadingData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sugar_reading': instance.sugarReading,
      'measurement_date': instance.measurementDate,
      'dateTime': instance.dateTime?.toIso8601String(),
      'user': instance.user,
      'user_Id': instance.userId,
    };
