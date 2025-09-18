import 'package:challenge_diabetes/core/helpers/constants.dart';
import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/features/doctor/model/data/doctor_response_body.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/booking/summary_row_widget.dart';
import 'package:flutter/material.dart';

class BookingSummaryWidget extends StatelessWidget {
  final DoctorResponseBody doctor;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController ageController;
  final String selectedGender;
  final DateTime selectedDate;
  final String? selectedTimeSlot;

  const BookingSummaryWidget({
    super.key,
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
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorsManager.mainBlue.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: ColorsManager.mainBlue.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'ملخص الحجز',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: ColorsManager.mainBlue,
            ),
          ),
          verticalSpace(12),
          ..._buildSummaryRows(),
        ],
      ),
    );
  }

  List<Widget> _buildSummaryRows() {
    return [
      SummaryRowWidget(label: 'الطبيب:', value: 'د. ${doctor.userName}'),
      SummaryRowWidget(
        label: 'الاسم:',
        value: nameController.text.isNotEmpty ? nameController.text : 'لم يتم الإدخال',
      ),
      SummaryRowWidget(
        label: 'رقم الهاتف:',
        value: phoneController.text.isNotEmpty ? phoneController.text : 'لم يتم الإدخال',
      ),
      SummaryRowWidget(
        label: 'العمر:',
        value: ageController.text.isNotEmpty ? '${ageController.text} سنة' : 'لم يتم الإدخال',
      ),
      SummaryRowWidget(label: 'الجنس:', value: selectedGender),
      SummaryRowWidget(
        label: 'التاريخ:',
        value: '${DateHelper.getArabicDayName(selectedDate.weekday)} ${selectedDate.day} ${DateHelper.getArabicMonth(selectedDate.month)}',
      ),
      SummaryRowWidget(
        label: 'الوقت:',
        value: selectedTimeSlot ?? 'لم يتم الاختيار',
      ),
      SummaryRowWidget(
        label: 'السعر:',
        value: '${doctor.detectionPrice} جنيه',
      ),
    ];
  }
}