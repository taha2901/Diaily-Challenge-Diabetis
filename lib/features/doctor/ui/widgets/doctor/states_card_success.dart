
import 'package:challenge_diabetes/features/doctor/model/data/doctor_response_body.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor/state_card.dart';
import 'package:flutter/material.dart';

class SatatesCardSuccess extends StatelessWidget {
  final List<DoctorResponseBody> doctors;
  const SatatesCardSuccess({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        StateCard(title: 'إجمالي الأطباء', value: doctors.length.toString()),
        StateCard(
          title: 'متاحين الآن',
          value: _getAvailableDoctorsCount(doctors).toString(),
        ),
        StateCard(
          title: 'متوسط التقييم',
          value: _getAverageRating(doctors).toStringAsFixed(1),
        ),
      ],
    );
  }
  
  int _getAvailableDoctorsCount(List<DoctorResponseBody> doctors) {
    return doctors.length;
  }

  double _getAverageRating(List<DoctorResponseBody> doctors) {
    if (doctors.isEmpty) return 0.0;

    final totalRating = doctors
        .where((doctor) => doctor.rate != null)
        .map((doctor) => doctor.rate!)
        .reduce((a, b) => a + b);

    final doctorsWithRating = doctors
        .where((doctor) => doctor.rate != null)
        .length;

    return doctorsWithRating > 0 ? totalRating / doctorsWithRating : 0.0;
  }

}
