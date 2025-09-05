import 'package:challenge_diabetes/core/helpers/extentions.dart';
import 'package:challenge_diabetes/core/routings/routers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an account? ',
              style: TextStyles.font13DarkBlueRegular,
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyles.font13BlueSemiBold.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: Colors.blue,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pushNamed(Routers.register);
                },
            ),
          ],
        ),
      ),
    );
  }
}