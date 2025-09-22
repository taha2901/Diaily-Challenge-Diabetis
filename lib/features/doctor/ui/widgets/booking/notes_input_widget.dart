import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NotesInputWidget extends StatelessWidget {
  final TextEditingController notesController;

  const NotesInputWidget({super.key, required this.notesController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.notes_title.tr(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: ColorsManager.mainBlue,
          ),
        ),
        verticalSpace(8),
        Text(
          LocaleKeys.notes_subtitle.tr(),
          style: const TextStyle(fontSize: 14, color: Colors.grey),
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
            decoration: InputDecoration(
              hintText: LocaleKeys.notes_hint.tr(),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
              hintStyle: const TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
