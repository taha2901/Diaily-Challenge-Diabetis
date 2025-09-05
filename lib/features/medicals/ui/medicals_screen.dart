import 'package:challenge_diabetes/features/medicals/model/data/medicine_response_body.dart';
import 'package:challenge_diabetes/features/medicals/ui/widgets/empty_medicine_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:challenge_diabetes/core/routings/routers.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/core/theming/styles.dart';
import 'package:challenge_diabetes/core/widget/custom_app_bar_doctors.dart';
import 'package:challenge_diabetes/features/medicals/logic/medicine_cubit.dart';
import 'package:challenge_diabetes/features/medicals/logic/medicine_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicineListScreen extends StatelessWidget {
  const MedicineListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.mainBackGround,
      body: Column(
        children: [
          const CustomAppBarForDoctors(title: 'Medicines'),
          Expanded(
            child: BlocBuilder<MedicineCubit, MedicineState>(
              builder: (context, state) {
                return state.when(
                  initial: () => Container(),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  success: (medicines) {
                    if (medicines.isEmpty) {
                      return const EmptyMedicineWidget1();
                    }
                    return ListView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      itemCount: medicines.length,
                      itemBuilder: (context, index) {
                        return _buildMedicineCard(
                          context,
                          medicine: medicines[index],
                        );
                      },
                    );
                  },
                  error: (apiErrorModel) =>
                      Center(child: Text("Error: ${apiErrorModel.title}")),
                  addMedicineLoading: () =>
                      const Center(child: CircularProgressIndicator()),
                  addMedicineSuccess: () => Container(),
                  addMedicineError: (apiErrorModel) =>
                      Center(child: Text("Add Error: ${apiErrorModel.title}")),
                  deleteMedicineLoading: () =>
                      const Center(child: CircularProgressIndicator()),
                  deleteMedicineSuccess: () => Container(),
                  deleteMedicineError: (apiErrorModel) => Center(
                    child: Text("Delete Error: ${apiErrorModel.title}"),
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
        label: const Text("Add Medicine"),
        icon: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildMedicineCard(
    BuildContext context, {
    required MedicineResponseBody medicine,
  }) {
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
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.medication,
                    color: Colors.blue[600],
                    size: 24.sp,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        medicine.name ?? 'Unnamed Medicine',
                        style: TextStyles.font18DarkBlueBold,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        medicine.dosage ?? '-',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuButton<String>(
                  onSelected: (value) async {
                    if (value == 'edit') {
                      final result = await Navigator.pushNamed(
                        context,
                        Routers.editMedicine,
                        arguments: medicine,
                      );
                      // إذا تم تعديل الدواء بنجاح، قم بتحديث القائمة
                      if (result == true) {
                        context.read<MedicineCubit>().getMedicine();
                      }
                    } else if (value == 'delete') {
                      _showDeleteDialog(context, medicine.id!);
                    }
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'edit',
                      child: Row(
                        children: [
                          Icon(Icons.edit, color: Colors.blue),
                          SizedBox(width: 8),
                          Text('Edit'),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(Icons.delete, color: Colors.red),
                          SizedBox(width: 8),
                          Text('Delete'),
                        ],
                      ),
                    ),
                  ],
                  icon: Icon(Icons.more_vert, color: Colors.grey[600]),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.green[100]!),
              ),
              child: Row(
                children: [
                  const Icon(Icons.access_time, color: Colors.green, size: 16),
                  const SizedBox(width: 8),
                  Text(
                    medicine.times ?? 'N/A',
                    style: TextStyle(
                      color: Colors.green[700],
                      fontWeight: FontWeight.w500,
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

  void _showDeleteDialog(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text("Delete Medicine"),
        content: const Text("Are you sure you want to delete this medicine?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text("Cancel", style: TextStyle(color: Colors.grey[600])),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              // 👉 استخدم Original context
              context.read<MedicineCubit>().deleteMedicine(id);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }
}
