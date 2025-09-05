import 'package:json_annotation/json_annotation.dart';

part 'blood_pressure_response_model.g.dart';

@JsonSerializable()
class BloodPressureResponseBody {
  final String? message;
  final BloodPressureData? data;

  BloodPressureResponseBody({
    this.message,
    this.data,
  });

  factory BloodPressureResponseBody.fromJson(Map<String, dynamic> json) =>
      _$BloodPressureResponseBodyFromJson(json);
}

@JsonSerializable()
class BloodPressureData {
  final int? id;
  @JsonKey(name: 'diastolic_pressure')
  final int? diastolicPressure;
  @JsonKey(name: 'systolic_pressure')
  final int? systolicPressure;
  @JsonKey(name: 'heart_rate')
  final int? heartRate;
  final String? dateTime;
  final String? user;
  @JsonKey(name: 'user_Id')
  final String? userId;

  BloodPressureData({
    this.id,
    this.diastolicPressure,
    this.systolicPressure,
    this.heartRate,
    this.dateTime,
    this.user,
    this.userId,
  });

  factory BloodPressureData.fromJson(Map<String, dynamic> json) =>
      _$BloodPressureDataFromJson(json);
}
