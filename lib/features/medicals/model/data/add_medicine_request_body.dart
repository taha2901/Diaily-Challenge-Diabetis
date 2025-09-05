import 'package:json_annotation/json_annotation.dart';

part 'add_medicine_request_body.g.dart';

@JsonSerializable()
class AddMedicineRequestBody {
  final String? name;
  final String? dosage;
  final String? times;
  final String? time;

  AddMedicineRequestBody({
    this.name,
    this.dosage,
    this.times,
    this.time,
  });

  factory AddMedicineRequestBody.fromJson(Map<String, dynamic> json) =>
      _$AddMedicineRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AddMedicineRequestBodyToJson(this);
}
