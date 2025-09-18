import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/booking/date_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateSelectionWidget extends StatelessWidget {
  final List<DateTime> availableDates;
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;

  const DateSelectionWidget({
    super.key,
    required this.availableDates,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'اختر التاريخ المناسب',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ColorsManager.mainBlue,
            ),
          ),
          verticalSpace(16),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.1.h,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: availableDates.length,
              itemBuilder: (context, index) {
                final date = availableDates[index];
                return DateCardWidget(
                  date: date,
                  isSelected: _isSelectedDate(date),
                  isToday: _isToday(date),
                  onTap: () => onDateSelected(date),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  bool _isSelectedDate(DateTime date) {
    return date.day == selectedDate.day &&
           date.month == selectedDate.month &&
           date.year == selectedDate.year;
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.day == now.day &&
           date.month == now.month &&
           date.year == now.year;
  }
}