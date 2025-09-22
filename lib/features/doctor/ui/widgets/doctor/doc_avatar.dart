import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/features/doctor/model/data/doctor_response_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocAvatar extends StatelessWidget {
  final DoctorResponseBody doctor;
  const DocAvatar({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'doctor_${doctor.id}',
      child: Container(
        width: 70.w,
        height: 70.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ColorsManager.mainBlue.withOpacity(0.8),
              ColorsManager.mainBlue,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: ColorsManager.mainBlue.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: doctor.photo.isNotEmpty
              ? Image.network(
                  doctor.photo,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return _buildDefaultAvatar();
                  },
                )
              : _buildDefaultAvatar(),
        ),
      ),
    );
  }

  Widget _buildDefaultAvatar() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ColorsManager.mainBlue.withOpacity(0.8),
            ColorsManager.mainBlue,
          ],
        ),
      ),
      child: Icon(Icons.medical_services, color: Colors.white, size: 32.sp),
    );
  }
}