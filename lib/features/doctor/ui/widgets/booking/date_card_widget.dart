import 'package:challenge_diabetes/core/helpers/constants.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class DateCardWidget extends StatelessWidget {
//   final DateTime date;
//   final bool isSelected;
//   final bool isToday;
//   final VoidCallback onTap;

//   const DateCardWidget({
//     super.key,
//     required this.date,
//     required this.isSelected,
//     required this.isToday,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 300),
//         decoration: BoxDecoration(
//           gradient: isSelected
//               ? LinearGradient(
//                   colors: [
//                     ColorsManager.mainBlue,
//                     ColorsManager.mainBlue.withOpacity(0.8),
//                   ],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 )
//               : null,
//           color: isSelected ? null : Colors.grey[50],
//           borderRadius: BorderRadius.circular(16),
//           border: Border.all(
//             color: isSelected
//                 ? ColorsManager.mainBlue
//                 : isToday
//                     ? ColorsManager.mainBlue.withOpacity(0.5)
//                     : Colors.grey[300]!,
//             width: 2,
//           ),
//           boxShadow: [
//             if (isSelected)
//               BoxShadow(
//                 color: ColorsManager.mainBlue.withOpacity(0.3),
//                 blurRadius: 12,
//                 offset: const Offset(0, 6),
//               )
//             else if (isToday)
//               BoxShadow(
//                 color: ColorsManager.mainBlue.withOpacity(0.1),
//                 blurRadius: 8,
//                 offset: const Offset(0, 4),
//               ),
//           ],
//         ),
//         child: Stack(
//           children: [
//             Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     DateHelper.getArabicDayName(date.weekday),
//                     style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w600,
//                       color: isSelected
//                           ? Colors.white
//                           : Colors.grey[600],
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     '${date.day}',
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       color: isSelected
//                           ? Colors.white
//                           : ColorsManager.mainBlue,
//                     ),
//                   ),
//                   Text(
//                     DateHelper.getArabicMonth(date.month),
//                     style: TextStyle(
//                       fontSize: 10,
//                       color: isSelected
//                           ? Colors.white70
//                           : Colors.grey[500],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             if (isToday)
//               Positioned(
//                 top: 6,
//                 right: 6,
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//                   decoration: BoxDecoration(
//                     color: isSelected
//                         ? Colors.white.withOpacity(0.9)
//                         : ColorsManager.mainBlue,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Text(
//                     'اليوم',
//                     style: TextStyle(
//                       fontSize: 8,
//                       color: isSelected
//                           ? ColorsManager.mainBlue
//                           : Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class DateCardWidget extends StatelessWidget {
  final DateTime date;
  final bool isSelected;
  final bool isToday;
  final VoidCallback onTap;

  const DateCardWidget({
    super.key,
    required this.date,
    required this.isSelected,
    required this.isToday,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
                  colors: [
                    ColorsManager.mainBlue,
                    ColorsManager.mainBlue.withOpacity(0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: isSelected ? null : Colors.grey[50],
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected
                ? ColorsManager.mainBlue
                : isToday
                ? ColorsManager.mainBlue.withOpacity(0.3)
                : Colors.grey[200]!,
            width: 1.5,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: ColorsManager.mainBlue.withOpacity(0.25),
                blurRadius: 20,
                offset: const Offset(0, 6),
                spreadRadius: 2,
              ),
          ],
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateHelper.getArabicDayName(date.weekday),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: isSelected
                          ? Colors.white.withOpacity(0.9)
                          : Colors.grey[600],
                    ),
                  ),
                  Text(
                    '${date.day}',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : ColorsManager.mainBlue,
                    ),
                  ),
                  // SizedBox(height: 6.h),
                  Text(
                    DateHelper.getArabicMonth(date.month),
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: isSelected
                          ? Colors.white.withOpacity(0.8)
                          : Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
