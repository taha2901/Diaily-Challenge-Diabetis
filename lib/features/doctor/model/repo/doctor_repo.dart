import 'package:challenge_diabetes/core/networking/api_error_handler.dart';
import 'package:challenge_diabetes/core/networking/api_result.dart';
import 'package:challenge_diabetes/core/networking/api_services.dart';
import 'package:challenge_diabetes/features/doctor/model/data/available_time_response.dart';
import 'package:challenge_diabetes/features/doctor/model/data/delete_reservaion_response.dart';
import 'package:challenge_diabetes/features/doctor/model/data/doctor_response_body.dart';
import 'package:challenge_diabetes/features/doctor/model/data/reservation_request_body.dart';
import 'package:challenge_diabetes/features/doctor/model/data/reservation_response_body.dart';
import 'package:challenge_diabetes/features/doctor/model/data/user_reservations_response_body.dart';
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

  //get reservations
  Future<ApiResult<UserReservationsResponseBody>> getUserReservations() async {
    try {
      final response = await _apiService.getUserReservations();
      return ApiResult.success(response);
    } catch (error) {
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

  Future<ApiResult<ReservationResponseBody>> addReservation(
    int doctorId,
    ReservationRequestBody reservationRequestBody,
  ) async {
    try {
      final response = await _apiService.addReservation(
        doctorId,
        reservationRequestBody,
      );
      debugPrint('Doctor ID IS: ${doctorId.toString()}');
      return ApiResult.success(response);
    } catch (error) {
      debugPrint('API Error: $error');
      // Return an ApiErrorModel for failures
      final errorHandler = ApiErrorHandler.handle(error);
      return ApiResult.failure(errorHandler);
    }
  }

  Future<ApiResult<AvailableTimesResponse>> getAvailableTime(
    int id,
    String date,
  ) async {
    try {
      final response = await _apiService.getAvailableTime(id, date);
      print("API Response: ${response.toString()}");
      return ApiResult.success(response);
    } catch (error) {
      print("API Error: ${error.toString()}");
      // Return an ApiErrorModel for failures
      final errorHandler = ApiErrorHandler.handle(error);
      return ApiResult.failure(errorHandler);
    }
  }

  Future<ApiResult<DeleteReservaionResponse>> deleteReservation(int id) async {
    try {
      final response = await _apiService.cancelReservation(id);
      print("API Response: ${response.toString()}");
      return ApiResult.success(response);
    } catch (error) {
      print("API Error: ${error.toString()}");
      // Return an ApiErrorModel for failures
      final errorHandler = ApiErrorHandler.handle(error);
      return ApiResult.failure(errorHandler);
    }
  }
}
