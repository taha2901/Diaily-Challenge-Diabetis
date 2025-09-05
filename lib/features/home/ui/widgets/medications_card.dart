import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:challenge_diabetes/features/medicals/logic/medicine_cubit.dart';
import 'package:challenge_diabetes/features/medicals/logic/medicine_state.dart';
import 'package:challenge_diabetes/features/home/ui/widgets/medication_item.dart';
import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/theming/styles.dart';

class MedicationsCard extends StatelessWidget {
  const MedicationsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicineCubit, MedicineState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox(),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (medicines) {
            final displayed = medicines.take(2).toList();
            if (displayed.isEmpty) return const SizedBox(); /// لا تعرض الكارد لو فاضي

            return _buildMedicationsCard(displayed);
          },
          error: (_) => const SizedBox(), // أو رسالة خطأ لو حابب
          addMedicineLoading: () => const SizedBox(),
          addMedicineSuccess: () => const SizedBox(),
          addMedicineError: (_) => const SizedBox(),
          deleteMedicineLoading: () => const SizedBox(),
          deleteMedicineSuccess: () => const SizedBox(),
          deleteMedicineError: (_) => const SizedBox(),
        );
      },
    );
  }

  Widget _buildMedicationsCard(List medicineList) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF3C7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.medication,
                  color: Color(0xFFF59E0B),
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Medication Reminder',
                  style: TextStyles.font18DarkBlueBold,
                ),
              ),
            ],
          ),
          verticalSpace(16),

          // Items
          ...medicineList.map(
            (medicine) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: MedicationItem(
                name: medicine.name ?? 'Unknown',
                time: medicine.times ?? 'N/A',
                dose: medicine.dosage ?? '',
                taken: false, // لو عندك فلاغ يؤكد انه تم، ضيفه
              ),
            ),
          ),
        ],
      ),
    );
  }
}
