import 'package:challenge_diabetes/core/helpers/extentions.dart';
import 'package:challenge_diabetes/core/routings/routers.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/core/theming/styles.dart';
import 'package:challenge_diabetes/features/signup/logic/cubit/sign_up_cubit.dart';
import 'package:challenge_diabetes/features/signup/logic/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) =>
          current is RegisterLoading ||
          current is RegisterSuccess ||
          current is RegisterError,
      listener: (context, state) {
        state.whenOrNull(
          registerLoading: () {
            _showLoadingDialog(context);
          },
          registerSuccess: (data) {
            context.pop(); // Close loading dialog
            _showSuccessDialog(context, data?.username ?? 'User');
          },
          registerError: (error) {
            context.pop(); // Close loading dialog
            _showErrorDialog(context, error);
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
              padding: EdgeInsets.all(24.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(
                    color: ColorsManager.mainBlue,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Creating your account...',
                    style: TextStyles.font16BlackBold,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Please wait while we set up your profile',
                    style: TextStyles.font14greyRegular,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showSuccessDialog(BuildContext context, String username) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => PopScope(
        canPop: false,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          content: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 80.w,
                  height: 80.h,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 50.r,
                  ),
                ),
                SizedBox(height: 20.h),
                
                Text(
                  'Welcome Aboard!',
                  style: TextStyles.font18DarkBlueBold,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12.h),
                
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyles.font14greyRegular,
                    children: [
                      const TextSpan(text: 'Hello '),
                      TextSpan(
                        text: username,
                        style: TextStyles.font14BlueSemiBold,
                      ),
                      const TextSpan(text: '! 🎉\n'),
                      const TextSpan(
                        text: 'Your account has been created successfully.',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManager.mainBlue,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    onPressed: () {
                      context.pop(); // Close success dialog
                      context.pushNamedAndRemoveUntil(
                        Routers.login,
                        predicate: (route) => false,
                      );
                    },
                    child: Text(
                      'Continue to Login',
                      style: TextStyles.font16WhiteSemiBold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 48.r,
            ),
            SizedBox(height: 16.h),
            
            Text(
              'Registration Failed',
              style: TextStyles.font18DarkBlueBold,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12.h),
            
            Text(
              error,
              style: TextStyles.font14greyRegular,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.mainBlue,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onPressed: () => context.pop(),
                child: Text(
                  'Try Again',
                  style: TextStyles.font16WhiteSemiBold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}