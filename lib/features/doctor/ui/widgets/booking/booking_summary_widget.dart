import 'package:challenge_diabetes/core/helpers/constants.dart';
import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/features/doctor/model/data/doctor_response_body.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/booking/summary_row_widget.dart';
import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BookingSummaryWidget extends StatelessWidget {
  final DoctorResponseBody doctor;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController ageController;
  final String selectedGender;
  final DateTime selectedDate;
  final String? selectedTimeSlot;

  const BookingSummaryWidget({
    super.key,
    required this.doctor,
    required this.nameController,
    required this.phoneController,
    required this.ageController,
    required this.selectedGender,
    required this.selectedDate,
    required this.selectedTimeSlot,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorsManager.mainBlue.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorsManager.mainBlue.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.booking_summary.tr(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: ColorsManager.mainBlue,
            ),
          ),
          verticalSpace(12),
          ..._buildSummaryRows(),
        ],
      ),
    );
  }

  List<Widget> _buildSummaryRows() {
    return [
      SummaryRowWidget(
        label: LocaleKeys.doctor.tr(),
        value: 'د. ${doctor.userName}',
      ),
      SummaryRowWidget(
        label: LocaleKeys.name.tr(),
        value: nameController.text.isNotEmpty
            ? nameController.text
            : LocaleKeys.not_entered.tr(),
      ),
      SummaryRowWidget(
        label: LocaleKeys.phone.tr(),
        value: phoneController.text.isNotEmpty
            ? phoneController.text
            : LocaleKeys.not_entered.tr(),
      ),
      SummaryRowWidget(
        label: LocaleKeys.age.tr(),
        value: ageController.text.isNotEmpty
            ? '${ageController.text} ${LocaleKeys.years.tr()}'
            : LocaleKeys.not_entered.tr(),
      ),
      SummaryRowWidget(label: LocaleKeys.gender.tr(), value: selectedGender),
      SummaryRowWidget(
        label: LocaleKeys.date.tr(),
        value:
            '${DateHelper.getArabicDayName(selectedDate.weekday)} ${selectedDate.day} ${DateHelper.getArabicMonth(selectedDate.month)}',
      ),
      SummaryRowWidget(
        label: LocaleKeys.time.tr(),
        value: selectedTimeSlot ?? LocaleKeys.not_selected.tr(),
      ),
      SummaryRowWidget(
        label: LocaleKeys.price.tr(),
        value: '${doctor.detectionPrice} ${LocaleKeys.currency.tr()}',
      ),
    ];
  }
}



// class BookingSummaryWidget extends StatelessWidget {
//   final DoctorResponseBody doctor;
//   final TextEditingController nameController;
//   final TextEditingController phoneController;
//   final TextEditingController ageController;
//   final String selectedGender;
//   final DateTime selectedDate;
//   final String? selectedTimeSlot;

//   const BookingSummaryWidget({
//     super.key,
//     required this.doctor,
//     required this.nameController,
//     required this.phoneController,
//     required this.ageController,
//     required this.selectedGender,
//     required this.selectedDate,
//     required this.selectedTimeSlot,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             ColorsManager.mainBlue.withOpacity(0.08),
//             Colors.white,
//           ],
//         ),
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(
//           color: ColorsManager.mainBlue.withOpacity(0.2),
//           width: 1,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: ColorsManager.mainBlue.withOpacity(0.1),
//             blurRadius: 15,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           // Header Section
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   ColorsManager.mainBlue,
//                   ColorsManager.mainBlue.withOpacity(0.9),
//                 ],
//               ),
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(20),
//                 topRight: Radius.circular(20),
//               ),
//             ),
//             child: Row(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.2),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: const Icon(
//                     Icons.receipt_long_rounded,
//                     color: Colors.white,
//                     size: 24,
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       LocaleKeys.booking_summary.tr(),
//                       style: const TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     Text(
//                       'مراجعة التفاصيل النهائية',
//                       style: TextStyle(
//                         fontSize: 13,
//                         color: Colors.white.withOpacity(0.9),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
          
//           // Content Section
//           Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               children: _buildSummaryRows(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   List<Widget> _buildSummaryRows() {
//     final summaryItems = [
//       {
//         'icon': Icons.local_hospital_rounded,
//         'label': LocaleKeys.doctor.tr(),
//         'value': 'د. ${doctor.userName}',
//         'color': Colors.blue,
//       },
//       {
//         'icon': Icons.person_rounded,
//         'label': LocaleKeys.name.tr(),
//         'value': nameController.text.isNotEmpty 
//             ? nameController.text 
//             : LocaleKeys.not_entered.tr(),
//         'color': Colors.green,
//       },
//       {
//         'icon': Icons.phone_rounded,
//         'label': LocaleKeys.phone.tr(),
//         'value': phoneController.text.isNotEmpty 
//             ? phoneController.text 
//             : LocaleKeys.not_entered.tr(),
//         'color': Colors.orange,
//       },
//       {
//         'icon': Icons.cake_rounded,
//         'label': LocaleKeys.age.tr(),
//         'value': ageController.text.isNotEmpty 
//             ? '${ageController.text} ${LocaleKeys.years.tr()}'
//             : LocaleKeys.not_entered.tr(),
//         'color': Colors.purple,
//       },
//       {
//         'icon': Icons.wc_rounded,
//         'label': LocaleKeys.gender.tr(),
//         'value': selectedGender,
//         'color': Colors.pink,
//       },
//       {
//         'icon': Icons.calendar_today_rounded,
//         'label': LocaleKeys.date.tr(),
//         'value': '${DateHelper.getArabicDayName(selectedDate.weekday)} ${selectedDate.day} ${DateHelper.getArabicMonth(selectedDate.month)}',
//         'color': Colors.indigo,
//       },
//       {
//         'icon': Icons.access_time_rounded,
//         'label': LocaleKeys.time.tr(),
//         'value': selectedTimeSlot ?? LocaleKeys.not_selected.tr(),
//         'color': Colors.teal,
//       },
//       {
//         'icon': Icons.payments_rounded,
//         'label': LocaleKeys.price.tr(),
//         'value': '${doctor.detectionPrice} ${LocaleKeys.currency.tr()}',
//         'color': Colors.amber,
//       },
//     ];

//     return summaryItems.asMap().entries.map((entry) {
//       int index = entry.key;
//       Map<String, dynamic> item = entry.value;
      
//       return Column(
//         children: [
//           ModernSummaryRowWidget(
//             icon: item['icon'],
//             label: item['label'],
//             value: item['value'],
//             color: item['color'],
//           ),
//           if (index < summaryItems.length - 1)
//             Container(
//               margin: const EdgeInsets.symmetric(vertical: 8),
//               height: 1,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Colors.transparent,
//                     Colors.grey[300]!,
//                     Colors.transparent,
//                   ],
//                 ),
//               ),
//             ),
//         ],
//       );
//     }).toList();
//   }
// }

// class ModernSummaryRowWidget extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final String value;
//   final Color color;

//   const ModernSummaryRowWidget({
//     super.key,
//     required this.icon,
//     required this.label,
//     required this.value,
//     required this.color,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
//       child: Row(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: color.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(
//                 color: color.withOpacity(0.2),
//                 width: 1,
//               ),
//             ),
//             child: Icon(
//               icon,
//               color: color,
//               size: 20,
//             ),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             flex: 2,
//             child: Text(
//               label,
//               style: TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.grey[700],
//               ),
//             ),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             flex: 3,
//             child: Container(
//               padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//               decoration: BoxDecoration(
//                 color: Colors.grey[50],
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(
//                   color: Colors.grey[200]!,
//                   width: 1,
//                 ),
//               ),
//               child: Text(
//                 value,
//                 style: const TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black87,
//                 ),
//                 textAlign: TextAlign.right,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }