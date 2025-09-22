import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyDocList extends StatelessWidget {
  const EmptyDocList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.medical_services_outlined,
            size: 80,
            color: Colors.grey[400],
          ),
          verticalSpace(16),
          Text(
            LocaleKeys.no_doctors_available.tr(),
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}