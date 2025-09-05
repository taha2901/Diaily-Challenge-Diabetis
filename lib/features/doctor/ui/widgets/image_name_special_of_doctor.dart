import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/features/doctor/model/data/doctor_response_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageAndNameAndSpecialityOfDoctor extends StatelessWidget {
  final DoctorResponseBody doctor;

  const ImageAndNameAndSpecialityOfDoctor({super.key, required this.doctor});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Container(
            width: 120.w,
            height: 120.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              border: Border.all(color: Colors.white, width: 4),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(56),
              child: doctor.photo.isNotEmpty
                  ? Image.network(
                      doctor.photo,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.white,
                          child: const Icon(
                            Icons.person,
                            color: ColorsManager.mainBlue,
                            size: 60,
                          ),
                        );
                      },
                    )
                  : Container(
                      color: Colors.white,
                      child: const Icon(
                        Icons.person,
                        color: ColorsManager.mainBlue,
                        size: 60,
                      ),
                    ),
            ),
          ),
          verticalSpace(16),
          Text(
            doctor.userName,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          verticalSpace(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.amber[300], size: 24),
              const SizedBox(width: 8),
              Text(
                doctor.rate?.toString() ?? '0.0',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              if (doctor.rateCount != null && doctor.rateCount! > 0) ...[
                horizontalSpace(4),
                Text(
                  '(${doctor.rateCount})',
                  style: const TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
              horizontalSpace(24),
              Icon(Icons.work_outline, color: Colors.white, size: 24),
            ],
          ),
          if (doctor.detectionPrice > 0) ...[
            verticalSpace(12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withOpacity(0.3)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.attach_money, color: Colors.white, size: 20),
                  horizontalSpace(4),
                  Text(
                    '${doctor.detectionPrice} جنيه',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
