import 'package:bloc/bloc.dart';
import 'package:challenge_diabetes/core/helpers/constants.dart';
import 'package:challenge_diabetes/features/measurments/logic/suger/suger_state.dart';
import 'package:challenge_diabetes/features/measurments/model/data/add_measurments_models/blood_suger_request_model.dart';
import 'package:challenge_diabetes/features/measurments/model/data/get_measurments_models/get_blood_suger_response.dart';
import 'package:challenge_diabetes/features/measurments/model/repo/suger_measurments_repo.dart';
import 'package:flutter/material.dart';
class MeasurmentsCubit extends Cubit<MeasurmentsState> {
  final MeasurmentRepo _measurmentRepo;

  MeasurmentsCubit(this._measurmentRepo)
      : super(const MeasurmentsState.initial());

  List<SugarMeasurement> sugarMeasurements = [];

  TextEditingController measurementDateController = TextEditingController();
  TextEditingController sugarReadingController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController sportController = TextEditingController();


void emitAddBloodSugar(String measurementDate, int sugarReading, DateTime dateTime) async {
  if (isClosed) return;
  emit(const MeasurmentsState.addBloodSugerLoading());

  final response = await _measurmentRepo.addBloodSugar(
    BloodSugerRequestBody(
      dateTime: dateTime, // ← هنا نستخدم التاريخ الممرر بدلاً من DateTime.now()
      measurementDate: measurementDate,
      sugarReading: sugarReading,
    ),
  );

  response.when(
    success: (addMedicine) async {
      if (isClosed) return;

      // بعد الإضافة الناجحة، نحدث البيانات للتاريخ المحدد
      String formattedDate = DateHelper.formatDate(dateTime);
      await fetchSugarData(formattedDate);
      
      emit(const MeasurmentsState.addBloodSugerSuccess());
    },
    failure: (error) {
      if (isClosed) return;
      emit(MeasurmentsState.addBloodSugerError(error: error.toString()));
    },
  );
}
  //get blood suger
  Future<void> fetchSugarData(String specificDate) async {
    if (isClosed) return;
    emit(const MeasurmentsState.getBloodSugerLoading());
    final response = await _measurmentRepo.getBloodSuger(specificDate);
    response.when(success: (bloodSugar) async {
      sugarMeasurements = bloodSugar.toList();
      if (isClosed) return;
      emit(
          MeasurmentsState.getBloodSugerSuccess(bloodSugar: sugarMeasurements));
    }, failure: (error) {
      if (isClosed) return;
      emit(MeasurmentsState.getBloodSugerError(error: error.toString()));
    });
  }
}
