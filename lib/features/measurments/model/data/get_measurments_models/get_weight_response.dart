import 'package:json_annotation/json_annotation.dart';

part 'get_weight_response.g.dart';

@JsonSerializable()
class WeightMeasurement {
  @JsonKey(name: 'user_Id')
  final String userId;
  
  final int weight;
  final bool sport;
  final String dateTime;

  WeightMeasurement({
    required this.userId,
    required this.weight,
    required this.sport,
    required this.dateTime,
  });

  factory WeightMeasurement.fromJson(Map<String, dynamic> json) => _$WeightMeasurementFromJson(json);


}
