import 'package:challenge_diabetes/features/medicals/ui/widgets/empty_medicine_widget.dart';
import 'package:challenge_diabetes/features/medicals/ui/widgets/medicine_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:challenge_diabetes/core/routings/routers.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
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
}
