
import 'package:challenge_diabetes/core/networking/api_error_handler.dart';
import 'package:challenge_diabetes/core/networking/api_result.dart';
import 'package:challenge_diabetes/core/networking/api_services.dart';
import 'package:challenge_diabetes/features/measurments/model/data/add_measurments_models/weight_request_model.dart';
import 'package:challenge_diabetes/features/measurments/model/data/add_measurments_models/weight_response_model.dart';
import 'package:challenge_diabetes/features/measurments/model/data/get_measurments_models/get_weight_response.dart';
import 'package:flutter/material.dart';

class WeightMeasurmentRepo {
  final ApiServices _apiService;
  WeightMeasurmentRepo(this._apiService);

  //add weight
  Future<ApiResult<WeightResponseBody>> addWeight(
    WeightRequestBody addWeight,
  ) async {
    try {
      final response = await _apiService.addWeight(addWeight);

      debugPrint('API Response: $response');
      return ApiResult.success(response);
    } catch (error) {
      debugPrint('API Error: $error');
      return ApiResult.failure(
        ApiErrorHandler.handle(error),
      );
    }
  }

  //get Weight
  Future<ApiResult<List<WeightMeasurement>>> getWeight(
      String specificDate) async {
    try {
      final response = await _apiService.getWeight(specificDate);

      debugPrint('API Response: $response');
      return ApiResult.success(response);
    } catch (error) {
      debugPrint('API Error: $error');
      return ApiResult.failure(
        ApiErrorHandler.handle(error),
      );
    }
  }
}
