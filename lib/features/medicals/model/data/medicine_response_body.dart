import 'package:json_annotation/json_annotation.dart';

part 'medicine_response_body.g.dart';

@JsonSerializable()
class MedicineResponseBody {
  final int? id;
  final String? name;
  final String? date;
  final String? times;
  final String? dosage;

  MedicineResponseBody({
    this.id,
    this.name,
    this.date,
    this.times,
    this.dosage,
  });

  factory MedicineResponseBody.fromJson(Map<String, dynamic> json) =>
      _$MedicineResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$MedicineResponseBodyToJson(this);
}
