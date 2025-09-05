import 'package:json_annotation/json_annotation.dart';
part 'login_response_body.g.dart';
@JsonSerializable()
class LoginResponseBody {
  String? message;
  bool? isAuthenticated;
  String? username;
  String? email;
  String? token;
  String? phone;


  LoginResponseBody({this.message, this.isAuthenticated, this.username, this.email, this.token, this.phone});

  factory LoginResponseBody.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseBodyFromJson(json);
}
