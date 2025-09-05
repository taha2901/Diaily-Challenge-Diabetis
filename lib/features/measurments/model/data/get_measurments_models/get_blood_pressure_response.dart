import 'package:json_annotation/json_annotation.dart';

part 'get_blood_pressure_response.g.dart';

@JsonSerializable()
class BloodPressureMeasurement {
  @JsonKey(name: 'user_Id')
  final String userId;
  final String dateTime;
  @JsonKey(name: 'systolic_pressure')
  final int systolicPressure;
  @JsonKey(name: 'diastolic_pressure')
  final int diastolicPressure;
  @JsonKey(name: 'heart_rate')
  final int heartRate;
  final String status;

  BloodPressureMeasurement({
    required this.userId,
    required this.dateTime,
    required this.systolicPressure,
    required this.diastolicPressure,
    required this.heartRate,
    required this.status,
  });

  // لتحويل JSON إلى كائن Dart
  factory BloodPressureMeasurement.fromJson(Map<String, dynamic> json) =>
      _$BloodPressureMeasurementFromJson(json);
}
