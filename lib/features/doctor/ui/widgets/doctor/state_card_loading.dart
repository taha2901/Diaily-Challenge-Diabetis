
import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ModernStatsCardLoading extends StatelessWidget {
  const ModernStatsCardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          horizontalSpace(12),
          Text(
             LocaleKeys.loading_text.tr(),
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white.withOpacity(0.9),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
