import 'package:challenge_diabetes/core/helpers/constants.dart';
import 'package:challenge_diabetes/core/helpers/shared_pref_helper.dart';
import 'package:challenge_diabetes/core/networking/dio_factory.dart';
import 'package:challenge_diabetes/features/login/data/models/login_request_body.dart';
import 'package:challenge_diabetes/features/login/data/repos/login_repo.dart';
import 'package:challenge_diabetes/features/login/logic/cubit/login_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  // Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Password visibility (اختياري - يمكن استخدام الـ local state في الـ UI)
  bool isPasswordHidden = true;

  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    // لا نحتاج emit هنا لأننا بنستخدم local state في الـ UI
  }

  void emitLoginState() async {
    try {
      // التأكد من أن البيانات موجودة
      if (emailController.text.trim().isEmpty ||
          passwordController.text.trim().isEmpty) {
        emit(const LoginState.error(error: 'يرجى ملء جميع الحقول المطلوبة'));
        return;
      }

      emit(const LoginState.loading());

      final response = await _loginRepo.login(
        LoginRequestBody(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        ),
      );

      response.when(
        success: (loginResponse) async {
          try {
            // حفظ التوكن واسم المستخدم
            await saveUserToken(loginResponse.token ?? '');
            await SharedPrefHelper.setSecuredString(
              SharedPrefKeys.userName,
              loginResponse.username ?? '',
            );
            final photo = await SharedPrefHelper.getSecuredString(
              SharedPrefKeys.userPhoto,
            );

            // مسح الحقول بعد النجاح (اختياري)
            _clearForm();

            emit(LoginState.success(loginResponse));
          } catch (e) {
            emit(
              const LoginState.error(
                error: 'حدث خطأ أثناء حفظ بيانات المستخدم',
              ),
            );
          }
        },
        failure: (error) {
          emit(LoginState.error(error: error.getAllErrorMessages()));
        },
      );
    } catch (e) {
      emit(
        const LoginState.error(
          error: 'حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى',
        ),
      );
    }
  }

  Future<void> saveUserToken(String token) async {
    if (token.isEmpty) {
      throw Exception('Token is empty');
    }

    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }

  void _clearForm() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  Future<void> close() {
    // تنظيف الـ controllers
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
