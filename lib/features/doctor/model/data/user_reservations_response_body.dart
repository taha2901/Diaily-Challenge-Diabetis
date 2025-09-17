import 'package:json_annotation/json_annotation.dart';

part 'user_reservations_response_body.g.dart';

@JsonSerializable()
class UserReservationsResponseBody {
  final String? message;
  final List<ReservationModel>? data;

  UserReservationsResponseBody({
    this.message,
    this.data,
  });

  factory UserReservationsResponseBody.fromJson(Map<String, dynamic> json) =>
      _$UserReservationsResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$UserReservationsResponseBodyToJson(this);
}

@JsonSerializable()
class ReservationModel {
  final int? reservationId;

  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
  final DateTime? date;

  final String? time;
  final DoctorModel? doctor;

  ReservationModel({
    this.reservationId,
    this.date,
    this.time,
    this.doctor,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) =>
      _$ReservationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationModelToJson(this);

  /// Helpers for date conversion
  static DateTime? _dateFromJson(String? date) =>
      date == null ? null : DateTime.tryParse(date);

  static String? _dateToJson(DateTime? date) => date?.toIso8601String();
}



@JsonSerializable()
class DoctorModel {
  final int? doctorId;
  final String? name;
  final String? specialty;
  final String? phone;
  final String? email;
  final String? address;
  final String? photo;
  final int? price;

  DoctorModel({
    this.doctorId,
    this.name,
    this.specialty,
    this.phone,
    this.email,
    this.address,
    this.photo,
    this.price,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorModelToJson(this);
}

