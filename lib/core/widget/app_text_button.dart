import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isLoading;
  final Color? shadowColor;

  const AppTextButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonHeight,
    this.buttonWidth,
    required this.buttonText,
    required this.textStyle,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth?.w ?? double.infinity,
      height: buttonHeight?.h ?? 52.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
        boxShadow: [
          BoxShadow(
            color: shadowColor?.withOpacity(0.2) ?? Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isLoading ? null : onPressed,
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
          child: Container(
            decoration: BoxDecoration(
              color: isLoading 
                  ? (backgroundColor ?? ColorsManager.mainBlue).withOpacity(0.7)
                  : backgroundColor ?? ColorsManager.mainBlue,
              borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding?.w ?? 20.w,
              vertical: verticalPadding?.h ?? 14.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isLoading) ...[
                  SizedBox(
                    width: 20.r,
                    height: 20.r,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        textStyle.color ?? Colors.white,
                      ),
                    ),
                  ),
                  horizontalSpace(8),
                ] else if (icon != null) ...[
                  Icon(
                    icon,
                    color: textStyle.color ?? Colors.white,
                    size: 20.r,
                  ),
                  horizontalSpace(8),
                ],
                Flexible(
                  child: Text(
                    isLoading ? 'Please wait...' : buttonText,
                    style: textStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}