import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/features/doctor/model/data/doctor_response_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceTagOfDoc extends StatelessWidget {
  final DoctorResponseBody doctor;
  const PriceTagOfDoc({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorsManager.mainBlue.withOpacity(0.1),
            ColorsManager.mainBlue.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: ColorsManager.mainBlue.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.payments_outlined,
            size: 16,
            color: ColorsManager.mainBlue,
          ),
          horizontalSpace(4),
          Text(
            '${doctor.detectionPrice} L.E',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: ColorsManager.mainBlue,
            ),
          ),
        ],
      ),
    );
  }
}