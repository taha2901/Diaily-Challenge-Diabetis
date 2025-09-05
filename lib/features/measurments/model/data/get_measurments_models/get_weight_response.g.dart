// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_weight_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeightMeasurement _$WeightMeasurementFromJson(Map<String, dynamic> json) =>
    WeightMeasurement(
      userId: json['user_Id'] as String,
      weight: (json['weight'] as num).toInt(),
      sport: json['sport'] as bool,
      dateTime: json['dateTime'] as String,
    );

Map<String, dynamic> _$WeightMeasurementToJson(WeightMeasurement instance) =>
    <String, dynamic>{
      'user_Id': instance.userId,
      'weight': instance.weight,
      'sport': instance.sport,
      'dateTime': instance.dateTime,
    };
