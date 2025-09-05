import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/theming/styles.dart';
import 'package:challenge_diabetes/core/widget/app_text_button.dart';
import 'package:challenge_diabetes/features/login/logic/cubit/login_cubit.dart';
import 'package:challenge_diabetes/features/login/ui/widgets/dont_have_account_text.dart';
import 'package:challenge_diabetes/features/login/ui/widgets/email_and_password.dart';
import 'package:challenge_diabetes/features/login/ui/widgets/login_bloc_listenter.dart';
import 'package:challenge_diabetes/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(40),
                // Header Section
                _buildHeader(),
                verticalSpace(50),
                
                // Form Section
                Expanded(
                  child: Column(
                    children: [
                      EmailAndPassword(formKey: formKey),
                      verticalSpace(16),
                      
                      // Forgot Password
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: TextButton(
                          onPressed: () {
                            // Handle forgot password
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyles.font13BlueRegular,
                          ),
                        ),
                      ),
                      verticalSpace(32),
                      
                      // Login Button
                      AppTextButton(
                        buttonText: 'Login',
                        textStyle: TextStyles.font16WhiteSemiBold,
                        buttonHeight: 50,
                        onPressed: () {
                          validateThenDoLogin(context);
                        },
                      ),
                      verticalSpace(24),
                      
                      // Terms and Conditions
                      const TermsAndConditionsText(),
                      
                      const Spacer(),
                      
                      // Sign Up Link
                      const DontHaveAccountText(),
                      verticalSpace(20),
                    ],
                  ),
                ),
                
                // BlocListener
                const LoginBlocListenter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome Back',
          style: TextStyles.font24BlueBold,
        ),
        verticalSpace(12),
        Text(
          'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
          style: TextStyles.font14greyRegular.copyWith(
            height: 1.4,
          ),
        ),
      ],
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginState();
    }
  }
}