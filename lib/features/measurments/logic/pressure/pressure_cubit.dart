import 'package:bloc/bloc.dart';
import 'package:challenge_diabetes/core/helpers/constants.dart';
import 'package:challenge_diabetes/features/measurments/logic/pressure/pressure_state.dart';
import 'package:challenge_diabetes/features/measurments/model/data/add_measurments_models/blood_pressure_request_model.dart';
import 'package:challenge_diabetes/features/measurments/model/data/get_measurments_models/get_blood_pressure_response.dart';
import 'package:challenge_diabetes/features/measurments/model/repo/pressure_mesurment_repo.dart';
import 'package:flutter/material.dart';

// class PressureCubit extends Cubit<PressureState> {
//   final PressureMeasurmentRepo _pressuretRepo;
//   PressureCubit(this._pressuretRepo) : super(const PressureState.initial());

//   List<BloodPressureMeasurement> bloodPressureMessurment = [];
//   BloodPressureMeasurement? selectedMeasurement;

//   TextEditingController diastolicController = TextEditingController();
//   TextEditingController systolicController = TextEditingController();
//   TextEditingController heartRateController = TextEditingController();

//   // تعديل دالة الإضافة لاستقبال التاريخ
//   Future<void> emitAddBloodPressure(DateTime selectedDate) async {
//     if (isClosed) return;
//     emit(const PressureState.addBloodPressureLoading());

//     final int? diastolicPressure =
//         int.tryParse(diastolicController.text.trim());
//     final int? systolicPressure = int.tryParse(systolicController.text.trim());
//     final int? heartRate = int.tryParse(heartRateController.text.trim());

//     if (diastolicPressure == null ||
//         systolicPressure == null ||
//         heartRate == null) {
//       emit(const PressureState.addBloodPressureError());
//       return;
//     }

//     final response = await _pressuretRepo.addBloodPressure(
//       BloodPressureRequestBody(
//         dateTime: selectedDate, // ← نستخدم التاريخ المحدد هنا
//         diastolicPressure: diastolicPressure,
//         heartRate: heartRate,
//         systolicPressure: systolicPressure,
//       ),
//     );

//     response.when(
//       success: (addPressure) async {
//         if (isClosed) return;

//         // نحدث البيانات للتاريخ المحدد
//         String formattedDate = DateHelper.formatDate(selectedDate);
//         await fetchPressureData(formattedDate);

//         emit(const PressureState.addBloodPressureSuccess());
//       },
//       failure: (error) {
//         if (isClosed) return;
//         emit(const PressureState.addBloodPressureError());
//       },
//     );
//   }

//   // Get Blood Pressure
//   // Get Blood Pressure
//   Future<void> fetchPressureData(String specificDate) async {
//     if (isClosed) return;
//     emit(const PressureState.getBloodPressureLoading());
//     final response = await _pressuretRepo.getBloodPressure(specificDate);

//     response.when(
//       success: (pressure) async {
//         if (isClosed) return;

//         bloodPressureMessurment = pressure.toList();

//         if (bloodPressureMessurment.isNotEmpty) {
//           selectedMeasurement = bloodPressureMessurment.last;
//           int heartRate = selectedMeasurement?.heartRate ?? 0;
//           emit(PressureState.getBloodPressureSuccess(
//               heartRate: heartRate, bloodPressure: bloodPressureMessurment));
//         } else {
//           emit(const PressureState.getBloodPressureEmpty());
//         }
//       },
//       failure: (error) {
//         if (isClosed) return;
//         emit(const PressureState.getBloodPressureError());
//       },
//     );
//   }
// }



class PressureCubit extends Cubit<PressureState> {
  final PressureMeasurmentRepo _pressureRepo;
  PressureCubit(this._pressureRepo) : super(const PressureState.initial());

  List<BloodPressureMeasurement> bloodPressureMessurment = [];
  BloodPressureMeasurement? selectedMeasurement;

  Future<void> emitAddBloodPressure({
    required int systolic,
    required int diastolic,
    required int heartRate,
    required DateTime selectedDate,
  }) async {
    if (isClosed) return;
    emit(const PressureState.addBloodPressureLoading());

    final response = await _pressureRepo.addBloodPressure(
      BloodPressureRequestBody(
        dateTime: selectedDate,
        diastolicPressure: diastolic,
        heartRate: heartRate,
        systolicPressure: systolic,
      ),
    );

    response.when(
      success: (_) async {
        if (isClosed) return;
        final formattedDate = DateHelper.formatDate(selectedDate);
        await fetchPressureData(formattedDate);
        emit(const PressureState.addBloodPressureSuccess());
      },
      failure: (_) {
        if (isClosed) return;
        emit(const PressureState.addBloodPressureError());
      },
    );
  }

  Future<void> fetchPressureData(String specificDate) async {
    if (isClosed) return;
    emit(const PressureState.getBloodPressureLoading());
    final response = await _pressureRepo.getBloodPressure(specificDate);

    response.when(
      success: (pressure) async {
        if (isClosed) return;
        bloodPressureMessurment = pressure.toList();
        if (bloodPressureMessurment.isNotEmpty) {
          selectedMeasurement = bloodPressureMessurment.last;
          final heartRate = selectedMeasurement?.heartRate ?? 0;
          emit(PressureState.getBloodPressureSuccess(
              heartRate: heartRate, bloodPressure: bloodPressureMessurment));
        } else {
          emit(const PressureState.getBloodPressureEmpty());
        }
      },
      failure: (_) {
        if (isClosed) return;
        emit(const PressureState.getBloodPressureError());
      },
    );
  }
}