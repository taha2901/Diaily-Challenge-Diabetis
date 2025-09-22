import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StateItem extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  const StateItem({super.key, required this.title, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
            horizontalSpace(8),
            Text(
              value,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        verticalSpace(4),
        Text(
          title,
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.white.withOpacity(0.9),
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}