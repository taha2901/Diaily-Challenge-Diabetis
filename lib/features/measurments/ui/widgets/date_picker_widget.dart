import 'package:challenge_diabetes/core/helpers/constants.dart';
import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DatePickerWidget extends StatelessWidget {
  final String selectedDate;
  final ValueChanged<String> onDateChanged;

  const DatePickerWidget({
    super.key,
    required this.selectedDate,
    required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildDateIcon(),
          const SizedBox(width: 12),
          Text(
            "${LocaleKeys.date.tr()}: $selectedDate",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          _buildEditButton(context),
        ],
      ),
    );
  }

  Widget _buildDateIcon() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF3B82F6).withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(
        Icons.calendar_today,
        color: Color(0xFF3B82F6),
        size: 20,
      ),
    );
  }

  Widget _buildEditButton(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => _selectDate(context),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: const Icon(
            Icons.edit_calendar,
            color: Color(0xFF3B82F6),
            size: 20,
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF3B82F6),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      final date = DateHelper.formatDate(picked);
      onDateChanged(date);
    }
  }
}