import 'package:challenge_diabetes/core/networking/api_error_handler.dart';
import 'package:challenge_diabetes/core/networking/api_result.dart';
import 'package:challenge_diabetes/core/networking/api_services.dart';
import 'package:challenge_diabetes/features/medicals/model/data/add_medicine_request_body.dart';
import 'package:challenge_diabetes/features/medicals/model/data/add_medicine_response_body.dart';
import 'package:challenge_diabetes/features/medicals/model/data/delete_medicine_response_body.dart';
import 'package:challenge_diabetes/features/medicals/model/data/medicine_response_body.dart';
import 'package:flutter/material.dart';

class MedicineRepo {
  final ApiServices _apiService;
  MedicineRepo(this._apiService);

  Future<ApiResult<List<MedicineResponseBody>>> getMedicines() async {
    try {
      final response = await _apiService.getMedicine();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(
        ApiErrorHandler.handle(error),
      );
    }
  }

  Future<ApiResult<AddMedicineResponseBody>> addMedicine(
    AddMedicineRequestBody addMedicineRequestBody,
  ) async {
    try {
      final response = await _apiService.addMedicine(addMedicineRequestBody);

      debugPrint('API Response: $response');
      return ApiResult.success(response);
    } catch (error) {
      debugPrint('API Error: $error');
      return ApiResult.failure(
        ApiErrorHandler.handle(error),
      );
    }
  }

  //delete medicine
  Future<ApiResult<DeleteMedicineResponse>> deleteMedicine(int id) async {
    try {
      final response = await _apiService.deleteMedicine(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(
        ApiErrorHandler.handle(error),
      );
    }
  }
}
