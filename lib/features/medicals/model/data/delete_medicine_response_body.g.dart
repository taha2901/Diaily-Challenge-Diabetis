// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_medicine_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteMedicineResponse _$DeleteMedicineResponseFromJson(
  Map<String, dynamic> json,
) => DeleteMedicineResponse(
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : DeleteMedicineData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DeleteMedicineResponseToJson(
  DeleteMedicineResponse instance,
) => <String, dynamic>{'message': instance.message, 'data': instance.data};

DeleteMedicineData _$DeleteMedicineDataFromJson(Map<String, dynamic> json) =>
    DeleteMedicineData(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      dosage: json['dosage'] as String?,
      times: json['times'] as String?,
      time: json['time'] as String?,
      userId: json['user_Id'] as String?,
      users: json['users'] as List<dynamic>?,
    );

Map<String, dynamic> _$DeleteMedicineDataToJson(DeleteMedicineData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dosage': instance.dosage,
      'times': instance.times,
      'time': instance.time,
      'user_Id': instance.userId,
      'users': instance.users,
    };
