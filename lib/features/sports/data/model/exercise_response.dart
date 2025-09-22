import 'package:json_annotation/json_annotation.dart';

part 'exercise_response.g.dart';

@JsonSerializable()
class Exercise {
  final String name;
  final String description;
  final String photo;
  final String moreInfoUrl;

  Exercise({
    required this.name,
    required this.description,
    required this.photo,
    required this.moreInfoUrl,
  });


  factory Exercise.fromJson(Map<String, dynamic> json) => _$ExerciseFromJson(json);


}
