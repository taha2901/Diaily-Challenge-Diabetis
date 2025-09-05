import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/routings/routers.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/core/theming/styles.dart';
import 'package:challenge_diabetes/features/home/ui/widgets/action_button.dart';
import 'package:flutter/material.dart';

class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          'Quick Actions',
          style: TextStyles.font18DarkBlueBold,
        ),
        verticalSpace(12),
        Row(
          children: [
            Expanded(
              child: ActionButton(
                icon: Icons.add_circle_outline,
                label: 'Add Reading',
                color: ColorsManager.mainBlue,
                onTap: () {
                  Navigator.of(
                    context,
                    rootNavigator: true,
                  ).pushNamed(Routers.measurement);
                },
              ),
            ),
            horizontalSpace(12),
            Expanded(
              child: ActionButton(
                icon: Icons.camera_alt_outlined,
                label: 'Food Photo',
                color: ColorsManager.lightGreen,
                onTap: () {
                  // Navigate to food scanner
                },
              ),
            ),
          ],
        ),
        verticalSpace(12),
        Row(
          children: [
            Expanded(
              child: ActionButton(
                icon: Icons.medical_information,
                label: 'Doctors',
                color: ColorsManager.trqwaz,
                onTap: () {
                  Navigator.of(
                    context,
                    rootNavigator: true,
                  ).pushNamed(Routers.doctors);
                },
              ),
            ),
            horizontalSpace(12),
            Expanded(
              child: ActionButton(
                icon: Icons.medical_services_outlined,
                label: 'Medications',
                color: ColorsManager.yellow,
                onTap: () {
                  Navigator.of(
                    context,
                    rootNavigator: true,
                  ).pushNamed(Routers.medicine);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}