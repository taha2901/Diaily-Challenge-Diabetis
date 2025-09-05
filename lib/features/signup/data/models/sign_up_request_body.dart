import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request_body.g.dart';

@JsonSerializable()
class RegisterRequestBody {
  @JsonKey(name: 'Username')
  final String name;

  @JsonKey(name: 'Email')
  final String email;

  @JsonKey(name: 'Phone')
  final String phone;

  @JsonKey(name: 'Password')
  final String password;

  @JsonKey(name: 'Address')
  final String address;

  @JsonKey(name: 'Photo')
  final String photo;

  RegisterRequestBody({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.photo,
    required this.address,
  });


  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);
}
