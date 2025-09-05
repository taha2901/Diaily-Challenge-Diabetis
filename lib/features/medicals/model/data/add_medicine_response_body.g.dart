// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_medicine_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddMedicineResponseBody _$AddMedicineResponseBodyFromJson(
  Map<String, dynamic> json,
) => AddMedicineResponseBody(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  dosage: json['dosage'] as String?,
  times: json['times'] as String?,
  date: json['date'] as String?,
  userId: json['user_Id'] as String?,
  users: json['users'] as List<dynamic>?,
);

Map<String, dynamic> _$AddMedicineResponseBodyToJson(
  AddMedicineResponseBody instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'dosage': instance.dosage,
  'times': instance.times,
  'date': instance.date,
  'user_Id': instance.userId,
  'users': instance.users,
};
