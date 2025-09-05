import 'package:challenge_diabetes/core/helpers/extentions.dart';
import 'package:challenge_diabetes/core/routings/routers.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/core/theming/styles.dart';
import 'package:challenge_diabetes/features/login/logic/cubit/login_cubit.dart';
import 'package:challenge_diabetes/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBlocListenter extends StatelessWidget {
  const LoginBlocListenter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            _showLoadingDialog(context);
          },
          success: (data) {
            context.pop();
            context.pushNamed(Routers.bottomNavBar);
          },
          error: (error) {
            _setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(
                    color: ColorsManager.mainBlue,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Logging in...',
                    style: TextStyles.font16BlackBold,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _setupErrorState(BuildContext context, String error) {
    context.pop(); // Close loading dialog
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        icon: Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 48.r,
        ),
        title: Text(
          'Login Failed',
          style: TextStyles.font18DarkBlueSemiBold,
          textAlign: TextAlign.center,
        ),
        content: Text(
          error,
          style: TextStyles.font15DarkBlueMedium,
          textAlign: TextAlign.center,
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: ColorsManager.mainBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              onPressed: () {
                context.pop();
              },
              child: Text(
                'Try Again',
                style: TextStyles.font14BlueSemiBold.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}