import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/routings/routers.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/core/theming/styles.dart';
import 'package:challenge_diabetes/features/home/ui/widgets/action_button.dart';
import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class QuickActionsSection extends StatefulWidget {
  const QuickActionsSection({super.key});

  @override
  State<QuickActionsSection> createState() => _QuickActionsSectionState();
}

class _QuickActionsSectionState extends State<QuickActionsSection> {
    String? _currentLocale;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    // التحقق من تغيير اللغة
    final newLocale = context.locale.toString();
    if (_currentLocale != null && _currentLocale != newLocale) {
      if (mounted) {
        setState(() {
          _currentLocale = newLocale;
        });
      }
    } else {
      _currentLocale = newLocale;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LocaleKeys.quick_actions.tr(), style: TextStyles.font18DarkBlueBold),
        verticalSpace(12),
        Row(
          children: [
            Expanded(
              child: ActionButton(
                icon: Icons.add_circle_outline,
                label:  LocaleKeys.add_reading.tr(),
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
                label:  LocaleKeys.food_photo.tr(),
                color: ColorsManager.lightGreen,
                onTap: () {
                  Navigator.of(
                    context,
                    rootNavigator: true,
                  ).pushNamed(Routers.picBot);
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
                label: LocaleKeys.doctors.tr(),
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
                label:  LocaleKeys.medications.tr(),
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
