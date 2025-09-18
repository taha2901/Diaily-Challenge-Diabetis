import 'package:json_annotation/json_annotation.dart';
part 'user_details_response.g.dart';
@JsonSerializable()
class UserDetailsResponse {
	String? username;
	String? email;
	String? phone;
	String? photoUrl;
	dynamic address;

	UserDetailsResponse({this.username, this.email, this.phone, this.photoUrl, this.address});


  factory UserDetailsResponse.fromJson(Map<String, dynamic> json) => _$UserDetailsResponseFromJson(json);

}
