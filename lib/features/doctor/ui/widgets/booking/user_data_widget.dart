// import 'package:challenge_diabetes/core/helpers/spacing.dart';
// import 'package:challenge_diabetes/core/theming/colors.dart';
// import 'package:challenge_diabetes/features/doctor/ui/widgets/booking/custom_field.dart';
// import 'package:challenge_diabetes/features/doctor/ui/widgets/booking/gender_selection_widget.dart';
// import 'package:challenge_diabetes/gen/locale_keys.g.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';

// class UserDataWidget extends StatelessWidget {
//   final TextEditingController nameController;
//   final TextEditingController phoneController;
//   final TextEditingController ageController;
//   final String selectedGender;
//   final Function(String) onGenderChanged;

//   const UserDataWidget({
//     super.key,
//     required this.nameController,
//     required this.phoneController,
//     required this.ageController,
//     required this.selectedGender,
//     required this.onGenderChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             LocaleKeys.user_data_title.tr(),
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: ColorsManager.mainBlue,
//             ),
//           ),
//           verticalSpace(20),
//           CustomTextField(
//             controller: nameController,
//             labelText: LocaleKeys.user_data_full_name.tr(),
//             prefixIcon: Icons.person,
//           ),
//           verticalSpace(16),
//           CustomTextField(
//             controller: phoneController,
//             labelText: LocaleKeys.user_data_phone.tr(),
//             prefixIcon: Icons.phone,
//             keyboardType: TextInputType.phone,
//           ),
//           verticalSpace(16),
//           CustomTextField(
//             controller: ageController,
//             labelText: LocaleKeys.user_data_age.tr(),
//             prefixIcon: Icons.cake,
//             keyboardType: TextInputType.number,
//           ),
//           verticalSpace(16),
//           GenderSelectionWidget(
//             selectedGender: selectedGender,
//             onGenderChanged: onGenderChanged,
//           ),
//         ],
//       ),
//     );
//   }
// }
