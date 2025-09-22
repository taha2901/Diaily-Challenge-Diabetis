import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/features/doctor/model/data/doctor_response_body.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/booking/doc_avatar_widget.dart';
import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
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
       color: Colors.grey.shade200
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
                    color: Colors.grey,
                  ),
                ),
                verticalSpace(4),
                Row(
                  children: [
                    const Icon(Icons.attach_money, color: Colors.grey, size: 16),
                    horizontalSpace(4),
                    Text(
                      '${doctor.detectionPrice} ${LocaleKeys.pound.tr()}',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    horizontalSpace(16),
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    horizontalSpace(4),
                    Text(
                      '${doctor.rate ?? 0}',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
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