
import 'package:challenge_diabetes/core/networking/api_error_handler.dart';
import 'package:challenge_diabetes/core/networking/api_result.dart';
import 'package:challenge_diabetes/core/networking/api_services.dart';
import 'package:challenge_diabetes/features/measurments/model/data/add_measurments_models/blood_suger_request_model.dart';
import 'package:challenge_diabetes/features/measurments/model/data/add_measurments_models/blood_suger_response_model.dart';
import 'package:challenge_diabetes/features/measurments/model/data/get_measurments_models/get_blood_suger_response.dart';
import 'package:flutter/material.dart';

class MeasurmentRepo {
  final ApiServices _apiService;
  MeasurmentRepo(this._apiService);

  // Add Blood Sugar
  Future<ApiResult<BloodSugerResponseBody>> addBloodSugar(
    BloodSugerRequestBody addSugerRequestBody,
  ) async {
    try {
      final response = await _apiService.addBloodSugar(addSugerRequestBody);

      debugPrint('API Response: $response');
      return ApiResult.success(response);
    } catch (error) {
      debugPrint('API Error: $error');
      return ApiResult.failure(
        ApiErrorHandler.handle(error),
      );
    }
  }

  //get Blood suger
  Future<ApiResult<List<SugarMeasurement>>> getBloodSuger(String specificDate) async {
    try {
      final response = await _apiService.getBloodSuger(specificDate);

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
