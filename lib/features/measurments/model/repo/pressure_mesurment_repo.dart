
import 'package:challenge_diabetes/core/networking/api_error_handler.dart';
import 'package:challenge_diabetes/core/networking/api_result.dart';
import 'package:challenge_diabetes/core/networking/api_services.dart';
import 'package:challenge_diabetes/features/measurments/model/data/add_measurments_models/blood_pressure_request_model.dart';
import 'package:challenge_diabetes/features/measurments/model/data/add_measurments_models/blood_pressure_response_model.dart';
import 'package:challenge_diabetes/features/measurments/model/data/get_measurments_models/get_blood_pressure_response.dart';
import 'package:flutter/material.dart';

class PressureMeasurmentRepo {
  final ApiServices _apiService;
  PressureMeasurmentRepo(this._apiService);

  Future<ApiResult<BloodPressureResponseBody>> addBloodPressure(
    BloodPressureRequestBody addPressureRequestBody,
  ) async {
    try {
      final response =
          await _apiService.addBloodPressure(addPressureRequestBody);

      debugPrint('API Response: $response');
      return ApiResult.success(response);
    } catch (error) {
      debugPrint('API Error: $error');
      return ApiResult.failure(
        ApiErrorHandler.handle(error),
      );
    }
  }
  //get blood pressure
  Future<ApiResult<List<BloodPressureMeasurement>>> getBloodPressure(
      String specificDate) async {
    try {
      final response = await _apiService.getPressure(specificDate);

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
