import 'package:challenge_diabetes/features/measurments/model/data/get_measurments_models/get_blood_suger_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'suger_state.freezed.dart';

@freezed
class MeasurmentsState with _$MeasurmentsState {
  const factory MeasurmentsState.initial() = _Initial;
  // blood suger
  const factory MeasurmentsState.addBloodSugerLoading() = AddBloodSugerLoading;
  const factory MeasurmentsState.addBloodSugerSuccess() = AddBloodSugerSuccess;
  const factory MeasurmentsState.addBloodSugerError({required String error}) =
      AddBloodSugerError;

  //get blood suger
  const factory MeasurmentsState.getBloodSugerLoading() = GetBloodSugerLoading;
  const factory MeasurmentsState.getBloodSugerSuccess({
    required List<SugarMeasurement> bloodSugar,
  }) = GetBloodSugerSuccess;
  const factory MeasurmentsState.getBloodSugerError({required String error}) =
      GetBloodSugerError;
}
