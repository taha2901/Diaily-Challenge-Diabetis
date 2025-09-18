import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/features/doctor/logic/doctors_cubit.dart';
import 'package:challenge_diabetes/features/doctor/logic/doctors_state.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/booking/booking_success_dialouge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingButtonWidget extends StatelessWidget {
  final VoidCallback onBooking;

  const BookingButtonWidget({super.key, required this.onBooking});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DoctorsCubit, DoctorsState>(
      listener: (context, state) {
        state.whenOrNull(
          reservationSuccess: (reservationResponse) {
            BookingSuccessDialog.show(context);
          },
          reservationError: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(error.getAllErrorMessages()),
                backgroundColor: Colors.red,
              ),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: BlocBuilder<DoctorsCubit, DoctorsState>(
            builder: (context, state) {
              return ElevatedButton(
                onPressed: state.maybeWhen(
                  reservationLoading: () => null,
                  orElse: () => onBooking,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.mainBlue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                child: state.maybeWhen(
                  reservationLoading: () => const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  ),
                  orElse: () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.calendar_month, size: 20),
                      horizontalSpace(8),
                      const Text(
                        'تأكيد الحجز',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}