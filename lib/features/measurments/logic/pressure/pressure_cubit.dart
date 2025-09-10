import 'package:bloc/bloc.dart';
import 'package:challenge_diabetes/core/helpers/constants.dart';
import 'package:challenge_diabetes/features/measurments/logic/pressure/pressure_state.dart';
import 'package:challenge_diabetes/features/measurments/model/data/add_measurments_models/blood_pressure_request_model.dart';
import 'package:challenge_diabetes/features/measurments/model/data/get_measurments_models/get_blood_pressure_response.dart';
import 'package:challenge_diabetes/features/measurments/model/repo/pressure_mesurment_repo.dart';
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