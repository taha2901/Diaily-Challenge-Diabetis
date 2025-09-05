import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StateItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String unit;
  final Color color;
  final Color backgroundColor;
  const StateItem({super.key, required this.icon, required this.label, required this.value, required this.unit, required this.color, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 48.w,
          height: 48.h,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Icon(icon, color: color, size: 24.sp),
        ),
        verticalSpace(8),
        Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
        verticalSpace(4),
        ///this is value
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(unit, style: TextStyle(color: ColorsManager.lightGrey, fontSize: 10.sp)),
      ],
    );
  }
}