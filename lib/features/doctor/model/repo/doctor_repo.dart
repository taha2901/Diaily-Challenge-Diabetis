import 'package:challenge_diabetes/core/networking/api_error_handler.dart';
import 'package:challenge_diabetes/core/networking/api_result.dart';
import 'package:challenge_diabetes/core/networking/api_services.dart';
import 'package:challenge_diabetes/features/doctor/model/data/doctor_response_body.dart';
import 'package:flutter/material.dart';

class DoctorRepo {
  final ApiServices _apiService;

  DoctorRepo(this._apiService);

  Future<ApiResult<List<DoctorResponseBody>>> getDoctors() async {
    try {
      final response = await _apiService.getDoctors();
      debugPrint("API Response: ${response.toString()}");
      return ApiResult.success(response);
    } catch (error) {
      debugPrint("API Error: ${error.toString()}");
      final errorHandler = ApiErrorHandler.handle(error);
      return ApiResult.failure(errorHandler);
    }
  }

  // Future<ApiResult<List<PopularDoctorResponseBody>>> getPopularDoctors() async {
  //   try {
  //     final response = await _apiService.getPopularDoctor();
  //     print("API Response: ${response.toString()}");
  //     return ApiResult.success(response);
  //   } catch (error) {
  //     print("API Error: ${error.toString()}");
  //     final errorHandler = ApiErrorHandler.handle(error);
  //     return ApiResult.failure(errorHandler);
  //   }
  // }

  // Future<ApiResult<ReservationResponseBody>> addReservation(
  //     int doctorId, ReservationRequestBody reservationRequestBody) async {
  //   try {
  //     final response =
  //         await _apiService.addReservation(doctorId, reservationRequestBody);
  //     print('Doctor ID IS: ${doctorId.toString()}');
  //     return ApiResult.success(response);
  //   } catch (error) {
  //     print('API Error: $error');
  //     // Return an ApiErrorModel for failures
  //     final errorHandler = ApiErrorHandler.handle(error);
  //     return ApiResult.failure(errorHandler);
  //   }
  // }
}
