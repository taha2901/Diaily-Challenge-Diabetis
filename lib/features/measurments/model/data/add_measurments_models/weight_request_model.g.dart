// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weight_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeightRequestBody _$WeightRequestBodyFromJson(Map<String, dynamic> json) =>
    WeightRequestBody(
      weight: (json['weight'] as num).toInt(),
      sport: json['sport'] as bool,
    );

Map<String, dynamic> _$WeightRequestBodyToJson(WeightRequestBody instance) =>
    <String, dynamic>{'weight': instance.weight, 'sport': instance.sport};
