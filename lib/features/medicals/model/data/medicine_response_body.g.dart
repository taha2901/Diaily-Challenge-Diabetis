// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicineResponseBody _$MedicineResponseBodyFromJson(
  Map<String, dynamic> json,
) => MedicineResponseBody(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  date: json['date'] as String?,
  times: json['times'] as String?,
  dosage: json['dosage'] as String?,
);

Map<String, dynamic> _$MedicineResponseBodyToJson(
  MedicineResponseBody instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'date': instance.date,
  'times': instance.times,
  'dosage': instance.dosage,
};
