import 'package:json_annotation/json_annotation.dart';

part 'weight_response_model.g.dart';

@JsonSerializable()
class WeightResponseBody {
  final String? message;
  final WeightData? data;

  WeightResponseBody({
     this.message,
     this.data,
  });

  factory WeightResponseBody.fromJson(Map<String, dynamic> json) =>
      _$WeightResponseBodyFromJson(json);

}

@JsonSerializable()
class WeightData {
  final int? id;
  final int? weight;
  final bool? sport;
  final String? dateTime;
  final String? user; 
  @JsonKey(name: 'user_Id')
  final String? userId;

  WeightData({
     this.id,
     this.weight,
     this.sport,
     this.dateTime,
    this.user,
     this.userId,
  });

  factory WeightData.fromJson(Map<String, dynamic> json) =>
      _$WeightDataFromJson(json);

}
