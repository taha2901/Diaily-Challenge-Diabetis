import 'package:json_annotation/json_annotation.dart';
part 'get_blood_suger_response.g.dart';

@JsonSerializable()
class SugarMeasurement {
  @JsonKey(name: 'user_Id')
  final String userId;
  final String dateTime;
  @JsonKey(name: 'measurement_date')
  final String measurementDate;
  @JsonKey(name: 'sugar_reading')
  final int sugarReading;
  final String status;

  SugarMeasurement({
    required this.userId,
    required this.dateTime,
    required this.measurementDate,
    required this.sugarReading,
    required this.status,
  });

  factory SugarMeasurement.fromJson(Map<String, dynamic> json) =>
      _$SugarMeasurementFromJson(json);

}
