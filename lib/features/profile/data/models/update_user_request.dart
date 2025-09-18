import 'package:json_annotation/json_annotation.dart';

part 'update_user_request.g.dart';

@JsonSerializable()
class UpdateUserRequest {
  final String userName;
  final String email;
  final String phone;

  UpdateUserRequest({
    required this.userName,
    required this.email,
    required this.phone,
  });


  Map<String, dynamic> toJson() => _$UpdateUserRequestToJson(this);
}
