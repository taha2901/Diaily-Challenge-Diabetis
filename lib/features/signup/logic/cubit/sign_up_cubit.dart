import 'package:challenge_diabetes/core/helpers/constants.dart';
import 'package:challenge_diabetes/core/helpers/shared_pref_helper.dart';
import 'package:challenge_diabetes/core/networking/dio_factory.dart';
import 'package:challenge_diabetes/features/signup/data/models/sign_up_request_body.dart';
import 'package:challenge_diabetes/features/signup/data/repo/sign_up_repo.dart';
import 'package:challenge_diabetes/features/signup/logic/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;
  RegisterCubit(this._registerRepo) : super(const RegisterState.initial());

  // Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();


  XFile? pickedImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> emitRegisterState() async {

    if (pickedImage == null) {
      emit(
        const RegisterState.registerError(
          error: "Please select a profile photo",
        ),
      );
      return;
    }

    emit(const RegisterState.registerLoading());

    final response = await _registerRepo.register(
      RegisterRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        address: addressController.text,
        photo: pickedImage!.path,
      ),
    );

    response.when(
      success: (registerResponse) async {
        try {
          final token = registerResponse.token ?? '';
          final username = registerResponse.username ?? '';
          final photoUrl = registerResponse.photoUrl ?? '';

          // حفظ التوكن
          await SharedPrefHelper.setSecuredString(
            SharedPrefKeys.userToken,
            token,
          );
          
          // حفظ اسم المستخدم
          await SharedPrefHelper.setSecuredString(
            SharedPrefKeys.userName,
            username,
          );
          
          // حفظ رابط الصورة من الـ Response
          if (photoUrl.isNotEmpty) {
            await SharedPrefHelper.setSecuredString(
              SharedPrefKeys.userPhoto,
              photoUrl,
            );
          } else {
            // في حالة عدم وجود رابط من الـ Server، احفظ المسار المحلي
            await SharedPrefHelper.setSecuredString(
              SharedPrefKeys.userPhoto,
              pickedImage!.path,
            );
          }

          DioFactory.setTokenIntoHeaderAfterLogin(token);

          emit(RegisterState.registerSuccess(registerResponse));
        } catch (e) {
          emit(
            const RegisterState.registerError(
              error: 'حدث خطأ أثناء حفظ بيانات المستخدم',
            ),
          );
        }
      },
      failure: (error) {
        emit(
          RegisterState.registerError(error: error.title ?? 'Unexpected error'),
        );
      },
    );
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    addressController.dispose();
    return super.close();
  }

  Future<void> pickImageFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
        maxWidth: 800,
        maxHeight: 800,
      );

      if (image != null) {
        pickedImage = image;
        emit(const RegisterState.imageSelected());
      }
    } catch (e) {
      emit(RegisterState.registerError(error: 'Error picking image from camera'));
      print('Error picking image from camera: $e');
    }
  }

  Future<void> pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
        maxWidth: 800,
        maxHeight: 800,
      );

      if (image != null) {
        pickedImage = image;
        emit(const RegisterState.imageSelected());
      }
    } catch (e) {
      emit(RegisterState.registerError(error: 'Error picking image from gallery'));
      debugPrint('Error picking image from gallery: $e');
    }
  }

  void removeImage() {
    pickedImage = null;
    emit(const RegisterState.imageSelected());
  }

  Future<void> pickImage() async {
    await pickImageFromGallery();
  }
}