import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/styles.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an account? ',
              style: TextStyles.font14greyRegular,
            ),
            TextSpan(
              text: 'Login',
              style: TextStyles.font14BlueSemiBold.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: Colors.blue,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pop(context);
                },
            ),
          ],
        ),
      ),
    );
  }
}