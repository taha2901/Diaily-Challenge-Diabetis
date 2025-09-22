import 'package:challenge_diabetes/features/doctor/model/data/doctor_response_body.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor/state_card.dart';
import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ModernStatsCardSuccess extends StatelessWidget {
  final List<DoctorResponseBody> doctors;

  const ModernStatsCardSuccess({super.key, required this.doctors});

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
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: StateItem(
              icon: Icons.groups_rounded,
              title: LocaleKeys.total_doctors.tr(),
              value: doctors.length.toString(),
            ),
          ),
          Container(
            width: 1,
            height: 40,
            color: Colors.white.withOpacity(0.3),
          ),
          Expanded(
            child: StateItem(
              icon: Icons.star_rounded,
              title: LocaleKeys.average_rating.tr(),
              value: _getAverageRating(doctors).toStringAsFixed(1),
            ),
          ),
        ],
      ),
    );
  }

  double _getAverageRating(List<DoctorResponseBody> doctors) {
    if (doctors.isEmpty) return 0.0;

    final totalRating = doctors
        .where((doctor) => doctor.rate != null)
        .map((doctor) => doctor.rate!)
        .fold(0.0, (a, b) => a + b);

    final doctorsWithRating =
        doctors.where((doctor) => doctor.rate != null).length;

    return doctorsWithRating > 0 ? totalRating / doctorsWithRating : 0.0;
  }
}
