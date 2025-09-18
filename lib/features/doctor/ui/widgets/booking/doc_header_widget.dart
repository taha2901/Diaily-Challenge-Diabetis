import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/features/doctor/model/data/doctor_response_body.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/booking/doc_avatar_widget.dart';
import 'package:flutter/material.dart';

class DoctorHeaderWidget extends StatelessWidget {
  final DoctorResponseBody doctor;

  const DoctorHeaderWidget({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorsManager.mainBlue,
            ColorsManager.mainBlue.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          DoctorAvatarWidget(photo: doctor.photo),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'د. ${doctor.userName}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                verticalSpace(4),
                Row(
                  children: [
                    const Icon(Icons.attach_money, color: Colors.white, size: 16),
                    horizontalSpace(4),
                    Text(
                      '${doctor.detectionPrice} جنيه',
                      style: const TextStyle(fontSize: 14, color: Colors.white70),
                    ),
                    horizontalSpace(16),
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    horizontalSpace(4),
                    Text(
                      '${doctor.rate ?? 0}',
                      style: const TextStyle(fontSize: 14, color: Colors.white70),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}