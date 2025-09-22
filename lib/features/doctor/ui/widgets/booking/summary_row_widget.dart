import 'package:flutter/material.dart';

class SummaryRowWidget extends StatelessWidget {
  final String label;
  final String value;

  const SummaryRowWidget({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: value.contains('لم يتم') ? Colors.red : Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



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
//     final theme = Theme.of(context);

//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         gradient: LinearGradient(
//           colors: [
//             color.withOpacity(0.05),
//             Colors.white,
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: color.withOpacity(0.08),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           )
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           /// Label with icon
//           Row(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: color.withOpacity(0.15),
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(icon, size: 18, color: color),
//               ),
//               const SizedBox(width: 12),
//               Text(
//                 label,
//                 style: theme.textTheme.bodySmall?.copyWith(
//                   fontWeight: FontWeight.w600,
//                   fontSize: 13,
//                   color: Colors.grey[700],
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 10),

//           /// Value inside highlighted box
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
//             decoration: BoxDecoration(
//               color: Colors.grey[100],
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Text(
//               value,
//               style: theme.textTheme.bodyMedium?.copyWith(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black87,
//               ),
//               textAlign: TextAlign.right,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }