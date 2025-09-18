import 'package:json_annotation/json_annotation.dart';
part 'update_user_response.g.dart';

@JsonSerializable()
class UpdateUserResponse {
  final String message;
  final User date;

  UpdateUserResponse({
    required this.message,
    required this.date,
  });

  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) => _$UpdateUserResponseFromJson(json);

}


@JsonSerializable()
class User {
  final String userName;
  final String email;
  final String phone;

  User({
    required this.userName,
    required this.email,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);


}