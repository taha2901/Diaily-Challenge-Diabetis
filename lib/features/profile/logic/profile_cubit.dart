
import 'package:challenge_diabetes/features/profile/data/models/update_user_request.dart';
import 'package:challenge_diabetes/features/profile/data/models/user_details_response.dart';
import 'package:challenge_diabetes/features/profile/data/repos/profile_repo.dart';
import 'package:challenge_diabetes/features/profile/logic/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  static ProfileCubit get(context) => BlocProvider.of(context);
  UserDetailsResponse? profileModelList;
  final ProfileRepo _profileRepo;
  ProfileCubit(this._profileRepo) : super(const ProfileState.initial());

  void getUserData() async {
    if (isClosed) return;
    emit(const ProfileState.profileLoading());

    final response = await _profileRepo.getProfile();
    response.when(success: (profileModel) {
      if (isClosed) return;

      profileModelList = profileModel;
      emit(ProfileState.profileSuccess(profileModel: profileModel));
    }, failure: (errorHandler) {
      if (isClosed) return;
      emit(ProfileState.profileError(errorHandler));
    });
  }

  // void changePassword(String oldPassword, String newPassword) async {
  //   if (isClosed) return;
  //   emit(const ProfileState.changePasswordLoading());
  //   final response = await _profileRepo.changePassword(
  //     ChangePasswordRequestModel(
  //         currentPassword: oldPassword, newPassword: newPassword),
  //   );
  //   response.when(success: (changePasswordResponseModel) {
  //     if (isClosed) return;
  //     emit(ProfileState.changePasswordSuccess(
  //         changePasswordResponseModel: changePasswordResponseModel));
  //     // SharedPrefHelper.setData(SharedPrefKeys.userPassword, newPassword);
  //     // SharedPrefHelper.getString(SharedPrefKeys.userPassword);
  //   }, failure: (errorHandler) {
  //     if (isClosed) return;
  //     emit(ProfileState.changePasswordError(errorHandler: errorHandler));
  //   });
  // }

  void updateProfile(
    String name,
    String phone,
    String email,
  ) async {
    if (isClosed) return;
    emit(const ProfileState.updateProfileLoading());
    final response = await _profileRepo.updateProfile(
      UpdateUserRequest(
        userName: name,
        phone: phone,
        email: email,
      ),
    );
    response.when(success: (loginResponseBody) {
      if (isClosed) return;

      // تحديث البيانات في `profileModelList`
      profileModelList?.username = name;
      profileModelList?.phone = phone;
      profileModelList?.email = email;

      emit(const ProfileState.updateProfileSuccess());
    }, failure: (errorHandler) {
      if (isClosed) return;
      emit(ProfileState.updateProfileError( errorHandler));
    });
  }
}
