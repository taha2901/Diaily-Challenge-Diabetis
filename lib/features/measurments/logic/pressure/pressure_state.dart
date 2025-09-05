import 'package:challenge_diabetes/features/measurments/model/data/get_measurments_models/get_blood_pressure_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pressure_state.freezed.dart';

@freezed
class PressureState with _$PressureState {
  const factory PressureState.initial() = _Initial;

  //Add blood pressure
  const factory PressureState.addBloodPressureLoading() =
      AddBloodPressureLoading;
  const factory PressureState.addBloodPressureSuccess() =
      AddBloodPressureSuccess;
  const factory PressureState.addBloodPressureError() = AddBloodPressureError;

  //Get blood pressure
  const factory PressureState.getBloodPressureLoading() =
      GetBloodPressureLoading;
  const factory PressureState.getBloodPressureSuccess({
    required List<BloodPressureMeasurement> bloodPressure,
    required int heartRate,
  }) = GetBloodPressureSuccess;
  const factory PressureState.getBloodPressureError() = GetBloodPressureError;

  const factory PressureState.getBloodPressureEmpty() = GetBloodPressureEmpty;
}
