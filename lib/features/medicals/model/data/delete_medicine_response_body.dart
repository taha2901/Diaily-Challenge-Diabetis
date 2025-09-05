import 'package:json_annotation/json_annotation.dart';

part 'delete_medicine_response_body.g.dart';

@JsonSerializable()
class DeleteMedicineResponse {
  final String? message;
  final DeleteMedicineData? data;

  DeleteMedicineResponse({
    this.message,
    this.data,
  });

  factory DeleteMedicineResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteMedicineResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteMedicineResponseToJson(this);
}

@JsonSerializable()
class DeleteMedicineData {
  final int? id;
  final String? name;
  final String? dosage;
  final String? times;
  final String? time;

  @JsonKey(name: 'user_Id')
  final String? userId;

  final List<dynamic>? users;

  DeleteMedicineData({
    this.id,
    this.name,
    this.dosage,
    this.times,
    this.time,
    this.userId,
    this.users,
  });

  factory DeleteMedicineData.fromJson(Map<String, dynamic> json) =>
      _$DeleteMedicineDataFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteMedicineDataToJson(this);
}
