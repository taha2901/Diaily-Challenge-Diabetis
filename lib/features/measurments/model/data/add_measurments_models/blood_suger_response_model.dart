import 'package:json_annotation/json_annotation.dart';

part 'blood_suger_response_model.g.dart';

@JsonSerializable()
class BloodSugerResponseBody {
  final String? message;
  final SugarReadingData? data;

  BloodSugerResponseBody({
     this.message,
     this.data,
  });

  factory BloodSugerResponseBody.fromJson(Map<String, dynamic> json) =>
      _$BloodSugerResponseBodyFromJson(json);

}

@JsonSerializable()
class SugarReadingData {
  final int? id;
  @JsonKey(name: 'sugar_reading')
  final int? sugarReading;
  @JsonKey(name: 'measurement_date')
  final String? measurementDate;
  final DateTime? dateTime;
  final String? user; 
  @JsonKey(name: 'user_Id')
  final String? userId;

  SugarReadingData({
     this.id,
     this.sugarReading,
     this.measurementDate,
     this.dateTime,
    this.user,
     this.userId,
  });

  factory SugarReadingData.fromJson(Map<String, dynamic> json) =>
      _$SugarReadingDataFromJson(json);

}
