class DeleteReservaionResponse {
	int? id;
	String? username;
	String? phone;
	int? age;
	String? sex;
	String? userId;
	int? doctorId;
	DateTime? date;
	String? time;
	bool? isDeleted;

	DeleteReservaionResponse({
		this.id, 
		this.username, 
		this.phone, 
		this.age, 
		this.sex, 
		this.userId, 
		this.doctorId, 
		this.date, 
		this.time, 
		this.isDeleted, 
	});

	factory DeleteReservaionResponse.fromJson(Map<String, dynamic> json) {
		return DeleteReservaionResponse(
			id: json['id'] as int?,
			username: json['username'] as String?,
			phone: json['phone'] as String?,
			age: json['age'] as int?,
			sex: json['sex'] as String?,
			userId: json['user_Id'] as String?,
			doctorId: json['doctor_Id'] as int?,
			date: json['date'] == null
						? null
						: DateTime.parse(json['date'] as String),
			time: json['time'] as String?,
			isDeleted: json['isDeleted'] as bool?,
		);
	}



	Map<String, dynamic> toJson() => {
				'id': id,
				'username': username,
				'phone': phone,
				'age': age,
				'sex': sex,
				'user_Id': userId,
				'doctor_Id': doctorId,
				'date': date?.toIso8601String(),
				'time': time,
				'isDeleted': isDeleted,
			};
}
