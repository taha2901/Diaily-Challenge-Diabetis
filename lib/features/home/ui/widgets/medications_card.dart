import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:challenge_diabetes/features/medicals/logic/medicine_cubit.dart';
import 'package:challenge_diabetes/features/medicals/logic/medicine_state.dart';
import 'package:challenge_diabetes/features/home/ui/widgets/medication_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class MedicationsCard extends StatefulWidget {
  const MedicationsCard({super.key});

  @override
  State<MedicationsCard> createState() => _MedicationsCardState();
}

class _MedicationsCardState extends State<MedicationsCard> {
    String? _currentLocale;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    // التحقق من تغيير اللغة
    final newLocale = context.locale.toString();
    if (_currentLocale != null && _currentLocale != newLocale) {
      if (mounted) {
        setState(() {
          _currentLocale = newLocale;
        });
      }
    } else {
      _currentLocale = newLocale;
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicineCubit, MedicineState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox(),
          loading: () => _buildShimmerLoading(),
          success: (medicines) {
            final displayed = medicines.take(2).toList();
            if (displayed.isEmpty) return const SizedBox();

            /// لا تعرض الكارد لو فاضي

            return _buildMedicationsCard(displayed);
          },
          error: (_) => const SizedBox(),
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

  Widget _buildShimmerLoading() {
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
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header shimmer
            Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 140,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Medicine items shimmer
            _buildShimmerMedicineItem(),
            const SizedBox(height: 8),
            _buildShimmerMedicineItem(),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerMedicineItem() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          horizontalSpace(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 120.w,
                  height: 14.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  width: 80,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 50,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ],
      ),
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
                  LocaleKeys.medication_reminder.tr(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Items
          ...medicineList.map(
            (medicine) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: MedicationItem(
                name: medicine.name ?? 'Unknown',
                time: medicine.times ?? 'N/A',
                dose: medicine.dosage ?? '',
                taken: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
