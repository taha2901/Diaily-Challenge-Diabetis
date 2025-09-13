import 'package:challenge_diabetes/core/helpers/constants.dart';
import 'package:challenge_diabetes/features/measurments/logic/weight/weight_state.dart';
import 'package:challenge_diabetes/features/measurments/model/data/add_measurments_models/weight_request_model.dart';
import 'package:challenge_diabetes/features/measurments/model/data/get_measurments_models/get_weight_response.dart';
import 'package:challenge_diabetes/features/measurments/model/repo/weight_measurment_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeightCubit extends Cubit<WeightState> {
  final WeightMeasurmentRepo _measurmentRepo;
  WeightCubit(this._measurmentRepo) : super(const WeightState.initial());

  List<WeightMeasurement> weightMeasurements = [];

  Future<void> emitAddWeight(
    int weight,
    String? activity,
    DateTime dateTime,
  ) async {
    if (isClosed) return;
    emit(const WeightState.addWeightLoading());

    // إصلاح المقارنة
    final isWalking = (activity ?? '').trim() == 'مشي';

    final response = await _measurmentRepo.addWeight(
      WeightRequestBody(sport: isWalking, weight: weight),
    );

    response.when(
      success: (_) async {
        if (isClosed) return;
        final formattedDate = DateHelper.formatDate(dateTime);
        await fetchWeightData(formattedDate);
        emit(const WeightState.addWeightSuccess());
      },
      failure: (_) {
        if (isClosed) return;
        emit(const WeightState.addWeightError());
      },
    );
  }

  Future<void> fetchWeightData(String specificDate) async {
    if (isClosed) return;
    emit(const WeightState.getWeightLoading());
    final response = await _measurmentRepo.getWeight(specificDate);
    response.when(
      success: (weight) async {
        weightMeasurements = weight.toList();
        if (isClosed) return;
        emit(
          WeightState.getWeightSuccess(weightMeasurements: weightMeasurements),
        );
      },
      failure: (error) {
        if (isClosed) return;
        emit(WeightState.getWeightError(error: error.toString()));
      },
    );
  }
}
