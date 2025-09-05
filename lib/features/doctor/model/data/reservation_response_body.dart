import 'package:freezed_annotation/freezed_annotation.dart';

class ReservationResponseBody {
	String? message;
	ReservationModelDetails? data;

	ReservationResponseBody({this.message, this.data});

	factory ReservationResponseBody.fromJson(Map<String, dynamic> json) {
		return ReservationResponseBody(
			message: json['message'] as String?,
			data: json['data'] == null
						? null
						: ReservationModelDetails.fromJson(json['data'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'message': message,
				'data': data?.toJson(),
			};
}

class ReservationModelDetails {
	int? id;
	String? username;
	String? phone;
	int? age;
	String? sex;
  @JsonKey(name: 'user_Id')
	String? userId;
  @JsonKey(name: 'doctor_Id')
	int? doctorId;
	String? date;
  String? time;

	ReservationModelDetails({
		this.id, 
		this.username, 
		this.phone, 
		this.age, 
		this.sex, 
		this.userId, 
		this.doctorId, 
		this.date, 
    this.time,
	});

	factory ReservationModelDetails.fromJson(Map<String, dynamic> json) => ReservationModelDetails(
				id: json['id'] as int?,
				username: json['username'] as String?,
				phone: json['phone'] as String?,
				age: json['age'] as int?,
				sex: json['sex'] as String?,
				userId: json['user_Id'] as String?,
				doctorId: json['doctor_Id'] as int?,
				date: json['date'] as String?,
        time: json['time'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'username': username,
				'phone': phone,
				'age': age,
				'sex': sex,
				'user_Id': userId,
				'doctor_Id': doctorId,
				'date': date,
			};
}
