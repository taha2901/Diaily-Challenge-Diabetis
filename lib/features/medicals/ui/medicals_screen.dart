import 'package:challenge_diabetes/features/medicals/ui/widgets/empty_medicine_widget.dart';
import 'package:challenge_diabetes/features/medicals/ui/widgets/medicine_card.dart';
import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:challenge_diabetes/core/routings/routers.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/core/widget/custom_app_bar_doctors.dart';
import 'package:challenge_diabetes/features/medicals/logic/medicine_cubit.dart';
import 'package:challenge_diabetes/features/medicals/logic/medicine_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class MedicineListScreen extends StatelessWidget {
  const MedicineListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.mainBackGround,
      body: Column(
        children: [
           CustomAppBarForDoctors(title: LocaleKeys.medicines.tr()),
          Expanded(
            child: BlocBuilder<MedicineCubit, MedicineState>(
              builder: (context, state) {
                return state.when(
                  initial: () => Container(),
                  // 🎯 استبدال CircularProgressIndicator بـ Shimmer
                  loading: () => _buildShimmerLoading(),
                  success: (medicines) {
                    if (medicines.isEmpty) {
                      return const EmptyMedicine();
                    }
                    return ListView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      itemCount: medicines.length,
                      itemBuilder: (context, index) {
                        return MedicineCard(medicine: medicines[index]);
                      },
                    );
                  },
                  error: (apiErrorModel) =>
                      Center(child: Text("${LocaleKeys.error.tr()}: ${apiErrorModel.title}")),
                  // 🎯 حالات التحميل الأخرى أيضا
                  addMedicineLoading: () => _buildShimmerLoading(),
                  addMedicineSuccess: () => Container(),
                  addMedicineError: (apiErrorModel) =>
                      Center(child: Text("${LocaleKeys.add_error.tr()}: ${apiErrorModel.title}")),
                  deleteMedicineLoading: () => _buildShimmerLoading(),
                  deleteMedicineSuccess: () => Container(),
                  deleteMedicineError: (apiErrorModel) => Center(
                    child: Text("${LocaleKeys.delete_error.tr()}: ${apiErrorModel.title}"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await Navigator.pushNamed(
            context,
            Routers.addMedicine,
          );
          // ✅ لو تمت الإضافة بنجاح، نعيد تحميل البيانات
          if (result == true) {
            context.read<MedicineCubit>().getMedicine();
          }
        },
        backgroundColor: Colors.blue[600],
        label:  Text(LocaleKeys.add_medicine.tr()),
        icon: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildShimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        itemCount: 5, // عدد الكاردات الوهمية
        itemBuilder: (context, index) {
          return _buildShimmerMedicineCard();
        },
      ),
    );
  }

  Widget _buildShimmerMedicineCard() {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Icon placeholder
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Medicine name placeholder
                      Container(
                        width: double.infinity,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      // Dosage placeholder
                      Container(
                        width: 120,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ),
                // Menu button placeholder
                Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            // Time container placeholder
            Container(
              width: 150,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}