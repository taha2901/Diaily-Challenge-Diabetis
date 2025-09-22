import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/features/doctor/model/data/doctor_response_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorHeroSection extends StatelessWidget {
  final DoctorResponseBody doctor;

  const DoctorHeroSection({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320.h,
      width: double.infinity,
      child: Stack(
        children: [
          // Main content
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 300.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Doctor Image with modern design
                  _buildDoctorImage(),

                  SizedBox(height: 20.h),

                  // Doctor Name with animation
                  _buildDoctorName(),

                  verticalSpace(12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorImage() {
    return SizedBox(
      width: 120.w,
      height: 120.h,
      child: Stack(
        children: [
          // Outer glow
          Container(
            width: 120.w,
            height: 120.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.3),
                  blurRadius: 30,
                  spreadRadius: 5,
                ),
              ],
            ),
          ),

          // Main image container
          Container(
            width: 120.w,
            height: 120.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 3,
              ),
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.2),
                  Colors.white.withOpacity(0.1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60.r),
              child: doctor.photo.isNotEmpty
                  ? Image.network(
                      doctor.photo,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          _buildDefaultAvatar(),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return _buildLoadingAvatar();
                      },
                    )
                  : _buildDefaultAvatar(),
            ),
          ),

          // Status indicator
          Positioned(
            bottom: 8,
            right: 8,
            child: Container(
              width: 20.w,
              height: 20.h,
              decoration: BoxDecoration(
                color: const Color(0xFF10B981),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF10B981).withOpacity(0.4),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDefaultAvatar() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.9),
            Colors.grey[100]!.withOpacity(0.9),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Icon(
        Icons.person_rounded,
        color: ColorsManager.mainBlue,
        size: 50.sp,
      ),
    );
  }

  Widget _buildLoadingAvatar() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.9),
            Colors.grey[100]!.withOpacity(0.9),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: SizedBox(
          width: 30.w,
          height: 30.h,
          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
        ),
      ),
    );
  }

  Widget _buildDoctorName() {
    return Text(
      'د. ${doctor.userName}',
      style: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        color: Colors.white,
        letterSpacing: 0.5,
        shadows: [
          Shadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
