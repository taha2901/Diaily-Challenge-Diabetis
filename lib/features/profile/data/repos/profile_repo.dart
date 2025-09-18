
import 'package:challenge_diabetes/core/networking/api_error_handler.dart';
import 'package:challenge_diabetes/core/networking/api_result.dart';
import 'package:challenge_diabetes/core/networking/api_services.dart';
import 'package:challenge_diabetes/features/profile/data/models/update_user_request.dart';
import 'package:challenge_diabetes/features/profile/data/models/update_user_response.dart';
import 'package:challenge_diabetes/features/profile/data/models/user_details_response.dart';

class ProfileRepo {
  final ApiServices _apiServices;

  ProfileRepo(this._apiServices);

  Future<ApiResult<UserDetailsResponse>> getProfile() async {
    try {
      final response = await _apiServices.getProfile();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(
      ApiErrorHandler.handle(error),
      );
    }
  }

  // Future<ApiResult<ChangePasswordResponseModel>> changePassword(
  //     ChangePasswordRequestModel changePasswordRequestModel) async {
  //   try {
  //     final response =
  //         await _apiServices.changePassword(changePasswordRequestModel);
  //     print('API Response: $response');
  //     return ApiResult.success(response);
  //   } catch (error) {
  //     print('API Error: $error');
  //     return ApiResult.failure(ErrorHandler.handle(error));
  //   }
  // }

  Future<ApiResult<UpdateUserResponse>> updateProfile(
      UpdateUserRequest updateProfileRequestModel) async {
    try {
      final response =
          await _apiServices.updateProfile(updateProfileRequestModel);
      print('API Response: $response');
      return ApiResult.success(response);
    } catch (error) {
      print('API Error: $error');
      return ApiResult.failure(
        ApiErrorHandler.handle(error),
      );
    }
  }
}
