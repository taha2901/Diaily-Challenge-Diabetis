import 'package:challenge_diabetes/core/helpers/constants.dart';
import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/booking/time_slot_widget.dart';
import 'package:flutter/material.dart';

class TimeSelectionWidget extends StatelessWidget {
  final List<String> availableTimeSlots;
  final DateTime selectedDate;
  final String? selectedTimeSlot;
  final Function(String) onTimeSelected;

  const TimeSelectionWidget({
    super.key,
    required this.availableTimeSlots,
    required this.selectedDate,
    required this.selectedTimeSlot,
    required this.onTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'اختر الوقت المناسب',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ColorsManager.mainBlue,
            ),
          ),
          verticalSpace(8),
          Text(
            '${DateHelper.getArabicDayName(selectedDate.weekday)} ${selectedDate.day} ${DateHelper.getArabicMonth(selectedDate.month)}',
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
          verticalSpace(16),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: availableTimeSlots.length,
              itemBuilder: (context, index) {
                final timeSlot = availableTimeSlots[index];
                return TimeSlotWidget(
                  timeSlot: timeSlot,
                  isSelected: selectedTimeSlot == timeSlot,
                  onTap: () => onTimeSelected(timeSlot),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
