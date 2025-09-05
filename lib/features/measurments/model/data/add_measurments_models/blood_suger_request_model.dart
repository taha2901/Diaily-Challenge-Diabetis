import 'package:json_annotation/json_annotation.dart';

part 'blood_suger_request_model.g.dart';

@JsonSerializable()
class BloodSugerRequestBody {
  @JsonKey(name: "sugar_reading")
  final int sugarReading;
  @JsonKey(name: "measurement_date")
  final String measurementDate;
  final DateTime dateTime;

  BloodSugerRequestBody({
    required this.sugarReading,
    required this.measurementDate,
    required this.dateTime,
  });


  Map<String, dynamic> toJson() => _$BloodSugerRequestBodyToJson(this);
}
