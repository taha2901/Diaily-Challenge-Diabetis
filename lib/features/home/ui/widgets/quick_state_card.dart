import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/core/theming/styles.dart';
import 'package:challenge_diabetes/features/home/ui/widgets/state_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuickStateCard extends StatelessWidget {
  const QuickStateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Today\'s Readings',
            style: TextStyles.font18DarkBlueBold,
          ),
          verticalSpace(16),
          Row(
            children: [
              Expanded(
                child: StateItem(
                  icon: Icons.bloodtype,
                  label: 'Sugar',
                  value: '142',
                  unit: 'mg/dL',
                  color: ColorsManager.red,
                  backgroundColor: ColorsManager.lighterRed,
                ),
              ),
              verticalSpace(12),
              Expanded(
                child: StateItem(
                  icon: Icons.favorite,
                  label: 'Pressure',
                  value: '120/80',
                  unit: 'mmHg',
                  color: ColorsManager.mainBlue,
                  backgroundColor: ColorsManager.lightBlue,
                ),
              ),
              verticalSpace(12),
              Expanded(
                child: StateItem(
                  icon: Icons.monitor_weight,
                  label: 'Weight',
                  value: '75',
                  unit: 'kg',
                  color: ColorsManager.lightGreen,
                  backgroundColor: ColorsManager.lighterGreen,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}