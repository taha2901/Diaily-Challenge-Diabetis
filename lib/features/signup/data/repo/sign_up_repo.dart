
import 'package:challenge_diabetes/core/networking/api_error_handler.dart';
import 'package:challenge_diabetes/core/networking/api_result.dart';
import 'package:challenge_diabetes/core/networking/api_services.dart';
import 'package:challenge_diabetes/features/signup/data/models/sign_up_request_body.dart';
import 'package:challenge_diabetes/features/signup/data/models/sign_up_response.dart';
import 'package:dio/dio.dart';

class RegisterRepo {
  final ApiServices _apiService;

  RegisterRepo(this._apiService);

  Future<ApiResult<RegisterResponseBody>> register(RegisterRequestBody  signupRequestBody) async {
  try {
    final formData = FormData.fromMap(signupRequestBody.toJson());
    final response = await _apiService.register(formData);
    return ApiResult.success(response);
  } catch (error) {
    return ApiResult.failure(ApiErrorHandler.handle(error));
  }
}

}