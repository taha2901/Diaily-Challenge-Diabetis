import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/features/doctor/model/data/doctor_response_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorRateWidget extends StatelessWidget {
  final  DoctorResponseBody doctor;
  const DoctorRateWidget({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.amber.withOpacity(0.3), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star_rounded, size: 16, color: Colors.amber[700]),
          horizontalSpace(4),
          Text(
            doctor.rate?.toStringAsFixed(1) ?? '0.0',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.amber[800],
            ),
          ),
        ],
      ),
    );
  }
}