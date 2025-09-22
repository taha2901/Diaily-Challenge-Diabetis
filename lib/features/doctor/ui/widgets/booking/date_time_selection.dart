import 'package:challenge_diabetes/core/helpers/constants.dart';
import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/booking/date_card_widget.dart';
import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateTimeSelectionWidget extends StatelessWidget {
  final List<DateTime> availableDates;
  final List<String> availableTimeSlots;
  final DateTime selectedDate;
  final String? selectedTimeSlot;
  final Function(DateTime) onDateSelected;
  final Function(String) onTimeSelected;

  const DateTimeSelectionWidget({
    super.key,
    required this.availableDates,
    required this.availableTimeSlots,
    required this.selectedDate,
    required this.selectedTimeSlot,
    required this.onDateSelected,
    required this.onTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          // قسم التاريخ
          Container(
            height: 250.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(14.sp),
                        decoration: BoxDecoration(
                          color: ColorsManager.mainBlue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(
                          Icons.calendar_today_outlined,
                          color: ColorsManager.mainBlue,
                          size: 26,
                        ),
                      ),
                      horizontalSpace(16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.date_selection.tr(),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            LocaleKeys.date_selection_suitable.tr(),
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 120,
                    padding: const EdgeInsets.only(bottom: 28),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      itemCount: availableDates.length,
                      itemBuilder: (context, index) {
                        final date = availableDates[index];
                        return Container(
                          width: 100,
                          margin: const EdgeInsets.only(left: 16),
                          child: DateCardWidget(
                            date: date,
                            isSelected: _isSelectedDate(date),
                            isToday: _isToday(date),
                            onTap: () => onDateSelected(date),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // قسم الوقت
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: ColorsManager.mainBlue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            Icons.access_time_outlined,
                            color: ColorsManager.mainBlue,
                            size: 26,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LocaleKeys.time_selection.tr(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              DateHelper.formatDate(selectedDate),
                              style: TextStyle(
                                fontSize: 15,
                                color: ColorsManager.mainBlue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(12.w, 0.h, 0.w, 16.h),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: availableTimeSlots.length,
                        itemBuilder: (context, index) {
                          final timeSlot = availableTimeSlots[index];
                          final isSelected = selectedTimeSlot == timeSlot;

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: GestureDetector(
                              onTap: () => onTimeSelected(timeSlot),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                decoration: BoxDecoration(
                                  gradient: isSelected
                                      ? LinearGradient(
                                          colors: [
                                            ColorsManager.mainBlue,
                                            ColorsManager.mainBlue.withOpacity(
                                              0.85,
                                            ),
                                          ],
                                        )
                                      : null,
                                  color: isSelected ? null : Colors.grey[50],
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: isSelected
                                        ? ColorsManager.mainBlue
                                        : Colors.grey[200]!,
                                    width: 1.5,
                                  ),
                                  boxShadow: isSelected
                                      ? [
                                          BoxShadow(
                                            color: ColorsManager.mainBlue
                                                .withOpacity(0.2),
                                            blurRadius: 12,
                                            offset: const Offset(0, 4),
                                            spreadRadius: 1,
                                          ),
                                        ]
                                      : [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(
                                              0.05,
                                            ),
                                            blurRadius: 8,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.schedule_outlined,
                                        size: 20,
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.grey[600],
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        timeSlot,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
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
