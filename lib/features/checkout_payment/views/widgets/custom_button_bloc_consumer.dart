import 'package:challenge_diabetes/features/checkout_payment/data/models/payment_intent_input_model.dart';
import 'package:challenge_diabetes/features/checkout_payment/presentation/manger/payment_cubit.dart';
import 'package:challenge_diabetes/features/checkout_payment/views/thank_you_view.dart';
import 'package:challenge_diabetes/features/doctor/logic/doctors_cubit.dart';
import 'package:challenge_diabetes/features/doctor/logic/doctors_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomButtonBlocConsumer extends StatelessWidget {
//   final double total;
//   final int doctorId;
//   final String startTime;
//   final VoidCallback onPaymentSuccess;

//   const CustomButtonBlocConsumer({
//     super.key,
//     required this.total,
//     required this.doctorId,
//     required this.startTime, required this.onPaymentSuccess,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<PaymenttCubit, PaymentState>(
//       listener: (context, state) {
//         if (state is PaymentSuccess) {
//           // لما الدفع ينجح، احجز الموعد
//           onPaymentSuccess();
//           Navigator.of(context).pushReplacement(
//             MaterialPageRoute(
//               builder: (context) {
//                 return ThankYouView(total: total.toStringAsFixed(2));
//               },
//             ),
//           );
//         }

//         if (state is PaymentFailure) {
//           Navigator.of(context).pop();
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Row(
//                 children: [
//                   Icon(Icons.error_outline, color: Colors.white),
//                   SizedBox(width: 8.w),
//                   Expanded(child: Text(state.errMessage)),
//                 ],
//               ),
//               backgroundColor: Colors.red[600],
//               behavior: SnackBarBehavior.floating,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//           );
//         }
//       },
//       builder: (context, state) {
//         return Container(
//           width: double.infinity,
//           height: 56.h,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16),
//             gradient: LinearGradient(
//               colors: [
//                 Theme.of(context).primaryColor,
//                 Theme.of(context).primaryColor.withOpacity(0.8),
//               ],
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Theme.of(context).primaryColor.withOpacity(0.3),
//                 spreadRadius: 1,
//                 blurRadius: 8,
//                 offset: const Offset(0, 4),
//               ),
//             ],
//           ),
//           child: ElevatedButton(
//             onPressed: state is PaymentLoading
//                 ? null
//                 : () {
//                     PaymentIntentInputModel paymentIntentInputModel =
//                         PaymentIntentInputModel(
//                       amount: '${(total).toInt()}',
//                       currency: 'USD',
//                       cusomerId: 'cus_SCZxTwXxxe7kWr',
//                     );

//                     BlocProvider.of<PaymenttCubit>(context)
//                         .makePayment(paymentIntentInputModel: paymentIntentInputModel);
//                   },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.transparent,
//               foregroundColor: Colors.white,
//               shadowColor: Colors.transparent,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               elevation: 0,
//             ),
//             child: state is PaymentLoading
//                 ? Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         width: 20.w,
//                         height: 20.h,
//                         child: CircularProgressIndicator(
//                           strokeWidth: 2,
//                           valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                         ),
//                       ),
//                       SizedBox(width: 12.w),
//                       Text(
//                         'Processing...',
//                         style: TextStyle(
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   )
//                 : Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.lock_rounded, size: 20.sp),
//                       SizedBox(width: 8.w),
//                       Text(
//                         'Pay Securely',
//                         style: TextStyle(
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//           ),
//         );
//       },
//     );
//   }
// }



class CustomButtonBlocConsumer extends StatelessWidget {
  final double total;
  final int doctorId;
  final String startTime;
  final Map<String, dynamic> bookingData;
  final VoidCallback onPaymentSuccess;

  const CustomButtonBlocConsumer({
    super.key,
    required this.total,
    required this.doctorId,
    required this.startTime,
    required this.bookingData,
    required this.onPaymentSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PaymenttCubit, PaymentState>(
          listener: (context, state) {
            if (state is PaymentSuccess) {
              // بعد نجاح الدفع، احجز الموعد
              final doctorsCubit = context.read<DoctorsCubit>();
              doctorsCubit.emitReservationStates(
                username: bookingData['username'],
                phone: bookingData['phone'],
                age: bookingData['age'],
                sex: bookingData['sex'],
                date: bookingData['date'],
                time: bookingData['time'],
                doctorId: bookingData['doctorId'],
                context: context,
              );
            }

            if (state is PaymentFailure) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      Icon(Icons.error_outline, color: Colors.white),
                      SizedBox(width: 8.w),
                      Expanded(child: Text(state.errMessage)),
                    ],
                  ),
                  backgroundColor: Colors.red[600],
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              );
            }
          },
        ),
        BlocListener<DoctorsCubit, DoctorsState>(
          listener: (context, state) {
            state.whenOrNull(
              reservationSuccess: (reservationResponse) {
                // إغلاق الBottomSheet
                onPaymentSuccess();
                // الانتقال لصفحة الشكر
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return ThankYouView(total: total.toStringAsFixed(2));
                    },
                  ),
                );
              },
              reservationError: (error) {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      error.getAllErrorMessages().isNotEmpty
                          ? error.getAllErrorMessages()
                          : 'حدث خطأ في الحجز',
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
              },
            );
          },
        ),
      ],
      child: Container(
        width: double.infinity,
        height: 56.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor.withOpacity(0.8),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: BlocBuilder<PaymenttCubit, PaymentState>(
          builder: (context, paymentState) {
            return BlocBuilder<DoctorsCubit, DoctorsState>(
              builder: (context, doctorsState) {
                bool isLoading = paymentState is PaymentLoading || 
                                doctorsState.maybeWhen(
                                  reservationLoading: () => true,
                                  orElse: () => false,
                                );

                return ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          // إصلاح الـ amount calculation (تحويل للـ cents)
                          int amountInCents = (total * 100).toInt();
                          
                          PaymentIntentInputModel paymentIntentInputModel =
                              PaymentIntentInputModel(
                            amount: amountInCents.toString(), // تحويل للـ cents
                            currency: 'USD',
                            cusomerId: 'cus_T6PAo02GRyQbjk',
                          );

                          BlocProvider.of<PaymenttCubit>(context)
                              .makePayment(paymentIntentInputModel: paymentIntentInputModel);
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: isLoading
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20.w,
                              height: 20.h,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              paymentState is PaymentLoading 
                                  ? 'Processing Payment...' 
                                  : 'Booking...',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.lock_rounded, size: 20.sp),
                            SizedBox(width: 8.w),
                            Text(
                              'Pay Securely',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
