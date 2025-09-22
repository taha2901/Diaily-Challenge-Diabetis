import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/features/doctor/ui/doctor_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerLoadDoctor extends StatelessWidget {
  const ShimmerLoadDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 20.h),
      itemCount: 6,
      itemBuilder: (context, index) {
        return const ModernDoctorCardShimmer();
      },
    );
  }
}



class ModernDoctorCardShimmer extends StatelessWidget {
  const ModernDoctorCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // صورة الطبيب Shimmer
          Container(
            width: 70.w,
            height: 70.h,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          
          horizontalSpace(16),
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // اسم الطبيب Shimmer
                Container(
                  height: 20,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                verticalSpace(8),
                // التقييم Shimmer
                Container(
                  height: 16,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                verticalSpace(8),
                // السعر Shimmer
                Container(
                  height: 16,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
          ),
          
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ],
      ),
    );
  }
}