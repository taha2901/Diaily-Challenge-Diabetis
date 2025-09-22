// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
  name: json['name'] as String,
  description: json['description'] as String,
  photo: json['photo'] as String,
  moreInfoUrl: json['moreInfoUrl'] as String,
);

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'photo': instance.photo,
  'moreInfoUrl': instance.moreInfoUrl,
};
