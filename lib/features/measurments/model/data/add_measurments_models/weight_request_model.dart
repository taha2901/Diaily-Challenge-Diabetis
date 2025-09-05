import 'package:json_annotation/json_annotation.dart';

part 'weight_request_model.g.dart';

@JsonSerializable()
class WeightRequestBody {
  final int weight;
  final bool sport;

  WeightRequestBody({
    required this.weight,
    required this.sport,
  });



  Map<String, dynamic> toJson() => _$WeightRequestBodyToJson(this);
}
