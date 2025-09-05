import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'By logging in, you agree to our ',
              style: TextStyles.font13GrayRegular.copyWith(
                height: 1.5,
              ),
            ),
            TextSpan(
              text: 'Terms & Conditions',
              style: TextStyles.font13DarkBlueRegular.copyWith(
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Handle terms tap
                  _showTermsDialog(context, 'Terms & Conditions');
                },
            ),
            TextSpan(
              text: ' and ',
              style: TextStyles.font13GrayRegular.copyWith(
                height: 1.5,
              ),
            ),
            TextSpan(
              text: 'Privacy Policy',
              style: TextStyles.font13DarkBlueMedium.copyWith(
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Handle privacy policy tap
                  _showTermsDialog(context, 'Privacy Policy');
                },
            ),
            TextSpan(
              text: '.',
              style: TextStyles.font13GrayRegular.copyWith(
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showTermsDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          style: TextStyles.font16BlackBold,
        ),
        content: Text(
          'Here would be the $title content.',
          style: TextStyles.font14greyRegular,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Close',
              style: TextStyles.font14BlueSemiBold,
            ),
          ),
        ],
      ),
    );
  }
}