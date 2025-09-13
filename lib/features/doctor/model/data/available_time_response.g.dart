// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_time_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailableTimesResponse _$AvailableTimesResponseFromJson(
  Map<String, dynamic> json,
) => AvailableTimesResponse(
  availableTimes: (json['availableTimes'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$AvailableTimesResponseToJson(
  AvailableTimesResponse instance,
) => <String, dynamic>{'availableTimes': instance.availableTimes};
