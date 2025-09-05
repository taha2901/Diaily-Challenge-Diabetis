import 'package:json_annotation/json_annotation.dart';

part 'blood_pressure_request_model.g.dart';

@JsonSerializable()
class BloodPressureRequestBody {
  @JsonKey(name: "diastolic_pressure")
  final int diastolicPressure;
  @JsonKey(name: "systolic_pressure")
  final int systolicPressure;
  @JsonKey(name: "heart_rate")
  final int heartRate;
  final DateTime dateTime;

  BloodPressureRequestBody({
    required this.diastolicPressure,
    required this.systolicPressure,
    required this.heartRate,
    required this.dateTime,
  });


  Map<String, dynamic> toJson() => _$BloodPressureRequestBodyToJson(this);
}
