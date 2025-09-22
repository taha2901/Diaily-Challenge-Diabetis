import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:flutter/material.dart';

class ArrowIconWidget extends StatelessWidget {
  const ArrowIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: ColorsManager.mainBlue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        Icons.arrow_forward_ios_rounded,
        color: ColorsManager.mainBlue,
        size: 16,
      ),
    );
  }
}