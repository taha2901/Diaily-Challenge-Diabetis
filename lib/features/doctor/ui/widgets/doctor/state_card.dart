import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/theming/styles.dart';
import 'package:flutter/material.dart';

class StateCard extends StatelessWidget {
  final String title;
  final String value;
  const StateCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style:  TextStyles.font18WhiteMedium,
          ),
          verticalSpace(4),
          Text(
            title,
            style: TextStyles.font12WhiteMedium,
          ),
        ],
      ),
    );
  }
}