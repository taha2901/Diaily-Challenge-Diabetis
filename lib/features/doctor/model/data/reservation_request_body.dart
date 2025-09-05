import 'package:json_annotation/json_annotation.dart';

part 'reservation_request_body.g.dart';

@JsonSerializable()
class ReservationRequestBody {
  String username;
  String phone;
  int age;
  String sex;
  String date;
  String time;

  ReservationRequestBody({
    required this.username,
    required this.phone,
    required this.age,
    required this.sex,
    required this.date,
    required this.time,
  });


  Map<String, dynamic> toJson() => _$ReservationRequestBodyToJson(this);
}
