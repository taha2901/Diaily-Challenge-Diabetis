import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ModernGenderSelectionWidget extends StatelessWidget {
  final String selectedGender;
  final Function(String) onGenderChanged;

  const ModernGenderSelectionWidget({
    super.key,
    required this.selectedGender,
    required this.onGenderChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.gender.tr(),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey[800],
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => onGenderChanged(LocaleKeys.male_male.tr()),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    gradient: selectedGender == LocaleKeys.male_male.tr()
                        ? LinearGradient(
                            colors: [
                              ColorsManager.mainBlue,
                              ColorsManager.mainBlue.withOpacity(0.8),
                            ],
                          )
                        : null,
                    color: selectedGender == LocaleKeys.male_male.tr() 
                        ? null 
                        : Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: selectedGender == LocaleKeys.male_male.tr()
                          ? ColorsManager.mainBlue
                          : Colors.grey[300]!,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.male,
                        color: selectedGender == LocaleKeys.male_male.tr()
                            ? Colors.white
                            : Colors.grey[600],
                      ),
                      const SizedBox(width: 8),
                      Text(
                        LocaleKeys.male_male.tr(),
                        style: TextStyle(
                          color: selectedGender == LocaleKeys.male_male.tr()
                              ? Colors.white
                              : Colors.grey[700],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: GestureDetector(
                onTap: () => onGenderChanged(LocaleKeys.female_female.tr()),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    gradient: selectedGender == LocaleKeys.female_female.tr()
                        ? LinearGradient(
                            colors: [
                              ColorsManager.mainBlue,
                              ColorsManager.mainBlue.withOpacity(0.8),
                            ],
                          )
                        : null,
                    color: selectedGender == LocaleKeys.female_female.tr() 
                        ? null 
                        : Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: selectedGender == LocaleKeys.female_female.tr()
                          ? ColorsManager.mainBlue
                          : Colors.grey[300]!,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.female,
                        color: selectedGender == LocaleKeys.female_female.tr()
                            ? Colors.white
                            : Colors.grey[600],
                      ),
                      const SizedBox(width: 8),
                      Text(
                        LocaleKeys.female_female.tr(),
                        style: TextStyle(
                          color: selectedGender == LocaleKeys.female_female.tr()
                              ? Colors.white
                              : Colors.grey[700],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}