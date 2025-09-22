import 'package:challenge_diabetes/core/theming/styles.dart';
import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppBarOfExcercise extends StatelessWidget {
  const AppBarOfExcercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black87),
          ),
          const SizedBox(width: 8),
          Text(
            LocaleKeys.sport_training.tr(),
            style: TextStyles.font18DarkBlueBold.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
