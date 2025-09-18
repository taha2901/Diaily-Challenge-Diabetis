import 'package:challenge_diabetes/core/networking/api_error_model.dart';
import 'package:challenge_diabetes/features/profile/data/models/user_details_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;

  const factory ProfileState.profileLoading() = ProfileLoading;

  const factory ProfileState.profileSuccess({required UserDetailsResponse? profileModel}) = ProfileSuccess;

  const factory ProfileState.profileError(ApiErrorModel apiErrorModel) = ProfileError;

  // change password
  // const factory ProfileState.changePasswordLoading() = ChangePasswordLoading;

  // const factory ProfileState.changePasswordSuccess(
  //     {required ChangePasswordResponseModel? changePasswordResponseModel}) = ChangePasswordSuccess;

  // const factory ProfileState.changePasswordError({required ErrorHandler errorHandler}) = ChangePasswordError;

  //update profile
  const factory ProfileState.updateProfileLoading() = UpdateProfileLoading;

  const factory ProfileState.updateProfileSuccess() = UpdateProfileSuccess;

  const factory ProfileState.updateProfileError(ApiErrorModel apiErrorModel) = UpdateProfileError;

  
}
