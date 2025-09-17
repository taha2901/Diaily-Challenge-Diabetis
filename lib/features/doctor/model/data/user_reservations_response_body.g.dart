// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_reservations_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserReservationsResponseBody _$UserReservationsResponseBodyFromJson(
  Map<String, dynamic> json,
) => UserReservationsResponseBody(
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => ReservationModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UserReservationsResponseBodyToJson(
  UserReservationsResponseBody instance,
) => <String, dynamic>{'message': instance.message, 'data': instance.data};

ReservationModel _$ReservationModelFromJson(Map<String, dynamic> json) =>
    ReservationModel(
      reservationId: (json['reservationId'] as num?)?.toInt(),
      date: ReservationModel._dateFromJson(json['date'] as String?),
      time: json['time'] as String?,
      doctor: json['doctor'] == null
          ? null
          : DoctorModel.fromJson(json['doctor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReservationModelToJson(ReservationModel instance) =>
    <String, dynamic>{
      'reservationId': instance.reservationId,
      'date': ReservationModel._dateToJson(instance.date),
      'time': instance.time,
      'doctor': instance.doctor,
    };

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) => DoctorModel(
  doctorId: (json['doctorId'] as num?)?.toInt(),
  name: json['name'] as String?,
  specialty: json['specialty'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  address: json['address'] as String?,
  photo: json['photo'] as String?,
  price: (json['price'] as num?)?.toInt(),
);

Map<String, dynamic> _$DoctorModelToJson(DoctorModel instance) =>
    <String, dynamic>{
      'doctorId': instance.doctorId,
      'name': instance.name,
      'specialty': instance.specialty,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'photo': instance.photo,
      'price': instance.price,
    };
