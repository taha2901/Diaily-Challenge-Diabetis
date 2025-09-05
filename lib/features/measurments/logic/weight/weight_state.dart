import 'package:challenge_diabetes/features/measurments/model/data/get_measurments_models/get_weight_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'weight_state.freezed.dart';


@freezed
class WeightState with _$WeightState {
  const factory WeightState.initial() = _Initial;

  const factory WeightState.addWeightLoading() = AddWeightLoading;
  const factory WeightState.addWeightSuccess() = AddWeightSuccess;
  const factory WeightState.addWeightError() = AddWeightError;

  const factory WeightState.getWeightLoading() = GetWeightLoading;
  const factory WeightState.getWeightSuccess(
      {required List<WeightMeasurement> weightMeasurements}) =
      GetWeightSuccess;
  const factory WeightState.getWeightError({required String error}) =
      GetWeightError;
}
