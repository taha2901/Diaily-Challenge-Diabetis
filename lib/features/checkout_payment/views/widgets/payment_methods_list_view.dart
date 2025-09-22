// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

// class PaymentMethodsListView extends StatefulWidget {
//   const PaymentMethodsListView({super.key});

//   @override
//   State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
// }

// class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
//   final List<Map<String, String>> paymentMethodsItems = const [
//     {
//       'image': 'assets/images/card.svg',
//       'title': 'Credit Card',
//       'subtitle': 'Visa, Mastercard, etc.'
//     },
//     {
//       'image': 'assets/images/paypal.svg',
//       'title': 'PayPal',
//       'subtitle': 'Pay with PayPal account'
//     }
//   ];

//   int activeIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: paymentMethodsItems.asMap().entries.map((entry) {
//         int index = entry.key;
//         Map<String, String> method = entry.value;
//         bool isActive = activeIndex == index;
        
//         return GestureDetector(
//           onTap: () {
//             setState(() {
//               activeIndex = index;
//             });
//           },
//           child: Container(
//             margin: EdgeInsets.only(bottom: 12.h),
//             padding: EdgeInsets.all(16.w),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(
//                 color: isActive 
//                   ? Theme.of(context).primaryColor 
//                   : Colors.grey[300]!,
//                 width: isActive ? 2 : 1,
//               ),
//               boxShadow: isActive
//                 ? [
//                     BoxShadow(
//                       color: Theme.of(context).primaryColor.withOpacity(0.1),
//                       spreadRadius: 2,
//                       blurRadius: 8,
//                       offset: const Offset(0, 2),
//                     ),
//                   ]
//                 : [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.1),
//                       spreadRadius: 1,
//                       blurRadius: 4,
//                       offset: const Offset(0, 2),
//                     ),
//                   ],
//             ),
//             child: Row(
//               children: [
//                 Container(
//                   width: 48.w,
//                   height: 48.h,
//                   padding: EdgeInsets.all(8.w),
//                   decoration: BoxDecoration(
//                     color: Colors.grey[50],
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: SvgPicture.asset(
//                     method['image']!,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//                 SizedBox(width: 16.w),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         method['title']!,
//                         style: TextStyle(
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.grey[800],
//                         ),
//                       ),
//                       SizedBox(height: 4.h),
//                       Text(
//                         method['subtitle']!,
//                         style: TextStyle(
//                           fontSize: 12.sp,
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: 20.w,
//                   height: 20.h,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(
//                       color: isActive 
//                         ? Theme.of(context).primaryColor 
//                         : Colors.grey[400]!,
//                       width: 2,
//                     ),
//                     color: isActive 
//                       ? Theme.of(context).primaryColor 
//                       : Colors.transparent,
//                   ),
//                   child: isActive
//                     ? Icon(
//                         Icons.check,
//                         size: 12.sp,
//                         color: Colors.white,
//                       )
//                     : null,
//                 ),
//               ],
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<Map<String, dynamic>> paymentMethodsItems = [
    {
      'image': 'assets/svg/card.svg',
      'title': 'Credit Card',
      'subtitle': 'Visa, Mastercard, etc.',
      'color': Colors.blue,
      'icon': Icons.credit_card_rounded,
    },
    {
      'image': 'assets/svg/paypal.svg',
      'title': 'PayPal',
      'subtitle': 'Pay with PayPal account',
      'color': Colors.indigo,
      'icon': Icons.account_balance_wallet_rounded,
    }
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: paymentMethodsItems.asMap().entries.map((entry) {
        int index = entry.key;
        Map<String, dynamic> method = entry.value;
        bool isActive = activeIndex == index;

        return GestureDetector(
          onTap: () {
            setState(() {
              activeIndex = index;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            margin: EdgeInsets.only(bottom: 16.h),
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18.r),
              border: Border.all(
                color: isActive
                    ? Theme.of(context).primaryColor
                    : Colors.grey.shade200,
                width: isActive ? 2.5 : 1,
              ),
              boxShadow: isActive
                  ? [
                      BoxShadow(
                        color: Theme.of(context).primaryColor.withOpacity(0.15),
                        spreadRadius: 0,
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ]
                  : [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.08),
                        spreadRadius: 0,
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
            ),
            child: Row(
              children: [
                Container(
                  width: 56.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        (method['color'] as Color).withOpacity(0.1),
                        (method['color'] as Color).withOpacity(0.05),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Stack(
                    children: [
                      if (method['image'] != null)
                        Center(
                          child: SvgPicture.asset(
                            method['image']!,
                            width: 32.w,
                            height: 32.h,
                            fit: BoxFit.contain,
                          ),
                        )
                      else
                        Center(
                          child: Icon(
                            method['icon'],
                            color: method['color'],
                            size: 28.sp,
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        method['title']!,
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800],
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        method['subtitle']!,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 26.w,
                  height: 26.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: isActive
                        ? LinearGradient(
                            colors: [
                              Theme.of(context).primaryColor,
                              Theme.of(context).primaryColor.withOpacity(0.8),
                            ],
                          )
                        : null,
                    color: isActive ? null : Colors.transparent,
                    border: Border.all(
                      color: isActive
                          ? Theme.of(context).primaryColor
                          : Colors.grey[400]!,
                      width: 2.5,
                    ),
                    boxShadow: isActive
                        ? [
                            BoxShadow(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.3),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ]
                        : null,
                  ),
                  child: isActive
                      ? Icon(
                          Icons.check_rounded,
                          size: 16.sp,
                          color: Colors.white,
                        )
                      : null,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}