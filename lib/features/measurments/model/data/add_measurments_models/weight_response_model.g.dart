// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weight_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeightResponseBody _$WeightResponseBodyFromJson(Map<String, dynamic> json) =>
    WeightResponseBody(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : WeightData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeightResponseBodyToJson(WeightResponseBody instance) =>
    <String, dynamic>{'message': instance.message, 'data': instance.data};

WeightData _$WeightDataFromJson(Map<String, dynamic> json) => WeightData(
  id: (json['id'] as num?)?.toInt(),
  weight: (json['weight'] as num?)?.toInt(),
  sport: json['sport'] as bool?,
  dateTime: json['dateTime'] as String?,
  user: json['user'] as String?,
  userId: json['user_Id'] as String?,
);

Map<String, dynamic> _$WeightDataToJson(WeightData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'weight': instance.weight,
      'sport': instance.sport,
      'dateTime': instance.dateTime,
      'user': instance.user,
      'user_Id': instance.userId,
    };
