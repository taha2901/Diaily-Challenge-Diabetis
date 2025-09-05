import 'package:challenge_diabetes/features/medicals/logic/medicine_state.dart';
import 'package:challenge_diabetes/features/medicals/model/data/add_medicine_request_body.dart';
import 'package:challenge_diabetes/features/medicals/model/repo/medicine_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicineCubit extends Cubit<MedicineState> {
  final MedicineRepo _medicineRepo;

  MedicineCubit(this._medicineRepo) : super(const MedicineState.initial());

  TextEditingController timeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController countController = TextEditingController();
  TextEditingController dosageController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void getMedicine() async {
    if (isClosed) return;
    emit(const MedicineState.loading());

    final response = await _medicineRepo.getMedicines();
    if (isClosed) return;
    response.when(
      success: (medicines) {
        if (!isClosed) emit(MedicineState.success(medicines));
      },
      failure: (errorModel) {
        if (!isClosed) emit(MedicineState.error(errorModel));
      },
    );
  }

  void emitAddMedicine() async {
    if (isClosed) return;
    emit(const MedicineState.addMedicineLoading());

    final response = await _medicineRepo.addMedicine(
      AddMedicineRequestBody(
        name: nameController.text.trim(),
        dosage: dosageController.text.trim(),
        time: timeController.text.trim(),
        times: countController.text.trim(),
      ),
    );

    if (isClosed) return;
    response.when(
      success: (_) async {
        if (!isClosed) {
          emit(const MedicineState.addMedicineSuccess());
          // إعادة تحميل البيانات بعد الإضافة
          await Future.delayed(Duration(milliseconds: 500)); // انتظار قصير
          getMedicine();
        }
      },
      failure: (error) {
        if (!isClosed) emit(MedicineState.addMedicineError(error));
      },
    );
  }

  void deleteMedicine(int id) async {
    if (isClosed) return;
    emit(const MedicineState.deleteMedicineLoading());
    
    final response = await _medicineRepo.deleteMedicine(id);
    if (isClosed) return;
    response.when(
      success: (_) {
        if (!isClosed) {
          emit(const MedicineState.deleteMedicineSuccess());
          // إعادة تحميل البيانات بعد الحذف
          getMedicine();
        }
      },
      failure: (errorModel) {
        if (!isClosed) emit(MedicineState.deleteMedicineError(errorModel));
      },
    );
  }

  // دالة جديدة للتعديل (إذا كان متوفر API للتعديل في المستقبل)
  void updateMedicine(int id, AddMedicineRequestBody updateData) async {
    if (isClosed) return;
    emit(const MedicineState.addMedicineLoading()); // يمكن إنشاء حالة منفصلة للتعديل
    
    // هنا ستكون دالة التعديل في الـ repo
    // final response = await _medicineRepo.updateMedicine(id, updateData);
    
    // حالياً كحل مؤقت: احذف ثم أضف
    final deleteResponse = await _medicineRepo.deleteMedicine(id);
    if (isClosed) return;
    
    deleteResponse.when(
      success: (_) async {
        final addResponse = await _medicineRepo.addMedicine(updateData);
        if (isClosed) return;
        
        addResponse.when(
          success: (_) {
            if (!isClosed) {
              emit(const MedicineState.addMedicineSuccess());
              getMedicine(); // إعادة تحميل البيانات
            }
          },
          failure: (error) {
            if (!isClosed) emit(MedicineState.addMedicineError(error));
          },
        );
      },
      failure: (errorModel) {
        if (!isClosed) emit(MedicineState.deleteMedicineError(errorModel));
      },
    );
  }

  // تنظيف الكنترولر
  void clearControllers() {
    nameController.clear();
    dosageController.clear();
    timeController.clear();
    countController.clear();
  }
}