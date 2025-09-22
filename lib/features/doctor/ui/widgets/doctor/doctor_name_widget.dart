import 'package:challenge_diabetes/features/doctor/model/data/doctor_response_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorNameWidget extends StatelessWidget {
  final DoctorResponseBody doctor;
  const DoctorNameWidget({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Text(
      doctor.userName,
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: const Color(0xFF1A1A1A),
        letterSpacing: -0.5,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}