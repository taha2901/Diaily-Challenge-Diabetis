import 'package:challenge_diabetes/core/di/dependency_injection.dart';
import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/features/doctor/logic/doctors_cubit.dart';
import 'package:challenge_diabetes/features/doctor/logic/doctors_state.dart';
import 'package:challenge_diabetes/features/doctor/model/data/user_reservations_response_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class MyReservationsScreen extends StatelessWidget {
  const MyReservationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.mainBackGround,
      appBar: AppBar(title: const Text('حجوزاتي'), centerTitle: true),
      body: BlocConsumer<DoctorsCubit, DoctorsState>(
        listener: (context, state) {
          if (state is DeleteReservationSuccess) {
            // ✅ بعد نجاح الحذف، نعمل refresh يدوي
            context.read<DoctorsCubit>().getUserReservation();
    
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('تم حذف الحجز بنجاح'),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is DeleteReservationError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'فشل في حذف الحجز: ${state.apiErrorModel.title}',
                ),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is UserReservationLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserReservationSuccess) {
            final reservations = state.reservations;
    
            if (reservations.isEmpty) {
              return const Center(child: Text('لا توجد حجوزات حالياً'));
            }
    
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: reservations.length,
              itemBuilder: (context, index) {
                final res = reservations[index];
                return ReservationCard(reservation: res);
              },
            );
          } else if (state is UserReservationError) {
            return Center(child: Text('حدث خطأ أثناء جلب البيانات'));
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class ReservationCard extends StatelessWidget {
  final ReservationModel reservation;

  const ReservationCard({super.key, required this.reservation});

  @override
  Widget build(BuildContext context) {
    final doctor = reservation.doctor;
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: doctor?.photo != null
                  ? NetworkImage(doctor!.photo!)
                  : null,
              child: doctor?.photo == null
                  ? const Icon(Icons.person, size: 35)
                  : null,
            ),
            horizontalSpace(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor?.name ?? 'دكتور غير معروف',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  verticalSpace(4),
                  Text(
                    '${doctor?.specialty ?? ''} - ${reservation.time ?? ''}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  verticalSpace(2),
                  Text(
                    'في: ${reservation.date?.toLocal().toString().split(" ")[0] ?? ''}',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Iconsax.trash, color: Colors.red),
              onPressed: () {
                _showDeleteDialog(context, reservation.reservationId!);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext rootContext, int reservationId) {
    showDialog(
      context: rootContext,
      builder: (dialogContext) => AlertDialog(
        title: const Text("تأكيد الحذف"),
        content: const Text("هل أنت متأكد من حذف هذا الحجز؟"),
        actions: [
          TextButton(
            child: const Text("إلغاء"),
            onPressed: () => Navigator.pop(dialogContext),
          ),
          TextButton(
            child: const Text("حذف", style: TextStyle(color: Colors.red)),
            onPressed: () {
              /// ✅ استخدم الـ root context (اللي في BlocProvider)
              rootContext.read<DoctorsCubit>().deleteReservation(
                reservationId,
                rootContext,
              );

              Navigator.pop(dialogContext);
            },
          ),
        ],
      ),
    );
  }
}
