
import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ModernStatsCardInitial extends StatelessWidget {
  const ModernStatsCardInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.medical_services_outlined,
            color: Colors.white,
            size: 24,
          ),
          horizontalSpace(12),
          Text(
            'جاري تحميل البيانات...',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white.withOpacity(0.9),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
