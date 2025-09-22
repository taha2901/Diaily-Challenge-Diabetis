import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/booking/custom_field.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/booking/gender_selection_widget.dart';
import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class UserDataWidget extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController ageController;
  final String selectedGender;
  final Function(String) onGenderChanged;

  const UserDataWidget({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.ageController,
    required this.selectedGender,
    required this.onGenderChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: ColorsManager.mainBlue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.person_outline,
                    color: ColorsManager.mainBlue,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'البيانات الشخصية',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    Text(
                      'أدخل بياناتك للحجز',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            CustomTextField(
              controller: nameController,
              labelText: LocaleKeys.user_data_full_name.tr(),
              prefixIcon: Icons.person,
            ),
            const SizedBox(height: 20),
            
            CustomTextField(
              controller: phoneController,
              labelText: LocaleKeys.user_data_phone.tr(),
              prefixIcon: Icons.phone,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            
            CustomTextField(
              controller: ageController,
              labelText: LocaleKeys.user_data_age.tr(),
              prefixIcon: Icons.cake,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            
            ModernGenderSelectionWidget(
              selectedGender: selectedGender,
              onGenderChanged: onGenderChanged,
            ),
          ],
        ),
      ),
    );
  }
}