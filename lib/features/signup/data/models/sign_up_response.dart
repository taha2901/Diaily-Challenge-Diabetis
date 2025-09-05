import 'package:json_annotation/json_annotation.dart';
part 'sign_up_response.g.dart';
@JsonSerializable()
class RegisterResponseBody {
  String? message;
  bool? isAuthenticated;
  String? username;
  String? email;
  String? photoUrl;
  String? token;
  String? phone;


  RegisterResponseBody({this.message, this.isAuthenticated, this.username, this.email, this.token, this.phone, this.photoUrl});

  factory RegisterResponseBody.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseBodyFromJson(json);
}
