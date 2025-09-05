import 'package:json_annotation/json_annotation.dart';

part 'add_medicine_response_body.g.dart';

@JsonSerializable()
class AddMedicineResponseBody {
  final int? id;
  final String? name;
  final String? dosage;
  final String? times;
  final String? date;

  @JsonKey(name: 'user_Id') 
  final String? userId;

  final List<dynamic>? users;

  AddMedicineResponseBody({
    this.id,
    this.name,
    this.dosage,
    this.times,
    this.date,
    this.userId,
    this.users,
  });

  factory AddMedicineResponseBody.fromJson(Map<String, dynamic> json) =>
      _$AddMedicineResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AddMedicineResponseBodyToJson(this);
}
