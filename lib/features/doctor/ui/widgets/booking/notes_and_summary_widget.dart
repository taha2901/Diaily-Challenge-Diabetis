import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/features/doctor/model/data/doctor_response_body.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/booking/booking_summary_widget.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/booking/notes_input_widget.dart';
import 'package:flutter/material.dart';

class NotesAndSummaryWidget extends StatelessWidget {
  final TextEditingController notesController;
  final DoctorResponseBody doctor;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController ageController;
  final String selectedGender;
  final DateTime selectedDate;
  final String? selectedTimeSlot;

  const NotesAndSummaryWidget({
    super.key,
    required this.notesController,
    required this.doctor,
    required this.nameController,
    required this.phoneController,
    required this.ageController,
    required this.selectedGender,
    required this.selectedDate,
    required this.selectedTimeSlot,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NotesInputWidget(notesController: notesController),
            verticalSpace(20),
            BookingSummaryWidget(
              doctor: doctor,
              nameController: nameController,
              phoneController: phoneController,
              ageController: ageController,
              selectedGender: selectedGender,
              selectedDate: selectedDate,
              selectedTimeSlot: selectedTimeSlot,
            ),
          ],
        ),
      ),
    );
  }
}
