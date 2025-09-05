import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? title;
  final int? status;
  final Map<String, List<String>>? errors;

  ApiErrorModel({
    this.title,
    this.status,
    this.errors,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  /// Returns a string containing all the error messages
  String getAllErrorMessages() {
    if (errors != null && errors!.isNotEmpty) {
      return errors!.entries.map((entry) {
        return '${entry.key}: ${entry.value.join(', ')}';
      }).join('\n');
    }
    return title ?? 'Unknown Error';
  }
}
