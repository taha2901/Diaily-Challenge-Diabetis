import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:flutter/material.dart';

class NotesInputWidget extends StatelessWidget {
  final TextEditingController notesController;

  const NotesInputWidget({super.key, required this.notesController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'ملاحظات إضافية (اختياري)',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: ColorsManager.mainBlue,
          ),
        ),
        verticalSpace(8),
        const Text(
          'أضف أي ملاحظات أو تفاصيل تريد أن يعرفها الطبيب',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        verticalSpace(20),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: TextField(
            controller: notesController,
            maxLines: 4,
            decoration: const InputDecoration(
              hintText: 'اكتب ملاحظاتك هنا...',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16),
              hintStyle: TextStyle(color: Colors.grey),
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}