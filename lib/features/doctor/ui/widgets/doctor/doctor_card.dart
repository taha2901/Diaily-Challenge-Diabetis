import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/routings/routers.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/core/theming/styles.dart';
import 'package:challenge_diabetes/features/doctor/model/data/doctor_response_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorCard extends StatelessWidget {
  final DoctorResponseBody doctor;

  const DoctorCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            Routers.doctorDetails,
            arguments: doctor, 
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 70.w,
                height: 70.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.grey[300],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: doctor.photo.isNotEmpty
                      ? Image.network(
                          doctor.photo,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: ColorsManager.mainBlue,
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 40.sp,
                              ),
                            );
                          },
                        )
                      : Container(
                          color: ColorsManager.mainBlue,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 40.sp,
                          ),
                        ),
                ),
              ),
              horizontalSpace(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor.userName,
                      style: TextStyles.font18DarkBlueBold,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    verticalSpace(4),

                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 16,
                          color: Colors.grey[600],
                        ),
                        horizontalSpace(4),
                        Expanded(
                          child: Text(
                            doctor.address,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(8),
                    Row(
                      children: [
                        Icon(Icons.star, size: 16, color: Colors.amber[600]),
                        horizontalSpace(4),
                        Text(
                          doctor.rate?.toString() ?? '0.0',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        horizontalSpace(16),
                        Icon(
                          Icons.work_outline,
                          size: 16.sp,
                          color: Colors.grey[600],
                        ),
                      ],
                    ),
                    if (doctor.detectionPrice > 0) ...[
                      verticalSpace(8),
                      Row(
                        children: [
                          Icon(
                            Icons.attach_money,
                            size: 16,
                            color: Colors.green[600],
                          ),
                          horizontalSpace(4),
                          Text(
                            '${doctor.detectionPrice} جنيه',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.green[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          // أيقونة المفضلة
                          Icon(
                            doctor.favorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: doctor.favorite
                                ? Colors.red
                                : Colors.grey[400],
                            size: 20,
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey[400],
                size: 20.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
