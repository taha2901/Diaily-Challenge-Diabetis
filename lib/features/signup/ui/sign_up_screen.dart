import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/routings/routers.dart';
import 'package:challenge_diabetes/core/theming/styles.dart';
import 'package:challenge_diabetes/core/widget/app_text_button.dart';
import 'package:challenge_diabetes/features/signup/logic/cubit/sign_up_cubit.dart';
import 'package:challenge_diabetes/features/signup/logic/cubit/sign_up_state.dart';
import 'package:challenge_diabetes/features/signup/ui/widget/already_have_account_text.dart';
import 'package:challenge_diabetes/features/signup/ui/widget/image_picker.dart';
import 'package:challenge_diabetes/features/signup/ui/widget/sign_up_bloc_listener.dart';
import 'package:challenge_diabetes/features/signup/ui/widget/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(20),
                // Header Section
                _buildHeader(),
                verticalSpace(40),
                
                // Form Card
                Container(
                  padding: EdgeInsets.all(24.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 20,
                        offset: const Offset(0, 4),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Profile Photo Picker
                      const ProfilePhotoPicker(),
                      verticalSpace(24),
                      
                      // Form Fields
                      const RegisterFormFields(),
                      verticalSpace(32),
                      
                      // Register Button
                      BlocBuilder<RegisterCubit, RegisterState>(
                        builder: (context, state) {
                          return AppTextButton(
                            buttonText: 'Create Account',
                            textStyle: TextStyles.font16WhiteSemiBold,
                            buttonHeight: 50,
                            isLoading: state is RegisterLoading,
                            onPressed: () {
                              _validateThenRegister(context);
                              Navigator.pushNamed(context, Routers.login);
                            },
                          );
                        },
                      ),
                      verticalSpace(20),
                      
                      // Already have account
                      const AlreadyHaveAccountText(),
                    ],
                  ),
                ),
                verticalSpace(20),
                
                // BlocListener
                const RegisterBlocListener(),
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
          'Create Account',
          style: TextStyles.font24BlueBold,
        ),
        verticalSpace(12),
        Text(
          'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
          style: TextStyles.font14greyRegular.copyWith(
            height: 1.4,
          ),
        ),
      ],
    );
  }

  void _validateThenRegister(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    if (cubit.formKey.currentState!.validate()) {
      cubit.emitRegisterState();
    }
  }
}