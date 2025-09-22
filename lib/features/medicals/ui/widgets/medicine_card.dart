import 'package:challenge_diabetes/core/routings/routers.dart';
import 'package:challenge_diabetes/core/theming/styles.dart';
import 'package:challenge_diabetes/features/medicals/logic/medicine_cubit.dart';
import 'package:challenge_diabetes/features/medicals/model/data/medicine_response_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../gen/locale_keys.g.dart';

class MedicineCard extends StatelessWidget {
  final MedicineResponseBody medicine;
  const MedicineCard({super.key, required this.medicine});

  @override
  Widget build(BuildContext context) {
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
                        medicine.name ?? LocaleKeys.unknown.tr(),
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
                    if (value == LocaleKeys.edit.tr()) {
                      final result = await Navigator.pushNamed(
                        context,
                        Routers.editMedicine,
                        arguments: medicine,
                      );
                      if (result == true) {
                        context.read<MedicineCubit>().getMedicine();
                      }
                    } else if (value == LocaleKeys.delete.tr()) {
                      _showDeleteDialog(context, medicine.id!);
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: LocaleKeys.edit.tr(),
                      child: Row(
                        children: [
                          const Icon(Icons.edit, color: Colors.blue),
                          const SizedBox(width: 8),
                          Text(LocaleKeys.edit.tr()),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: LocaleKeys.delete.tr(),
                      child: Row(
                        children: [
                          const Icon(Icons.delete, color: Colors.red),
                          const SizedBox(width: 8),
                          Text(LocaleKeys.delete.tr()),
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
        title: Text(LocaleKeys.delete_medicine_title.tr()),
        content: Text(LocaleKeys.delete_medicine_message.tr()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(
              LocaleKeys.cancel.tr(),
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              context.read<MedicineCubit>().deleteMedicine(id);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text(LocaleKeys.delete.tr()),
          ),
        ],
      ),
    );
  }
}
