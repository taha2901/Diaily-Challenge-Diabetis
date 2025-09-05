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

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void emitLoginState() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    response.when(
      success: (loginResponse) async {
        await saveUserToken(loginResponse.token ?? '');
        await SharedPrefHelper.setSecuredString(
          SharedPrefKeys.userName,
          loginResponse.username ?? '',
        );
        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        emit(LoginState.error(error: error.getAllErrorMessages() ));
      },
    );
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);

    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}
