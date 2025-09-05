// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_medicine_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddMedicineRequestBody _$AddMedicineRequestBodyFromJson(
  Map<String, dynamic> json,
) => AddMedicineRequestBody(
  name: json['name'] as String?,
  dosage: json['dosage'] as String?,
  times: json['times'] as String?,
  time: json['time'] as String?,
);

Map<String, dynamic> _$AddMedicineRequestBodyToJson(
  AddMedicineRequestBody instance,
) => <String, dynamic>{
  'name': instance.name,
  'dosage': instance.dosage,
  'times': instance.times,
  'time': instance.time,
};
