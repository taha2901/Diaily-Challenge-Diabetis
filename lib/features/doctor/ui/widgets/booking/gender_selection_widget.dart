import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

class GenderSelectionWidget extends StatelessWidget {
  final String selectedGender;
  final Function(String) onGenderChanged;

  const GenderSelectionWidget({
    super.key,
    required this.selectedGender,
    required this.onGenderChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'الجنس',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        verticalSpace(8),
        Row(
          children: [
            Expanded(
              child: RadioListTile<String>(
                title: const Text('ذكر'),
                value: 'ذكر',
                groupValue: selectedGender,
                onChanged: (value) => onGenderChanged(value!),
              ),
            ),
            Expanded(
              child: RadioListTile<String>(
                title: const Text('أنثى'),
                value: 'أنثى',
                groupValue: selectedGender,
                onChanged: (value) => onGenderChanged(value!),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
