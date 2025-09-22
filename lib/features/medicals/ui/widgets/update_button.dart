import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateButton extends StatelessWidget {
  final VoidCallback onUpdate;
  final bool isLoading;

  const UpdateButton({
    Key? key,
    required this.onUpdate,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : onUpdate,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green[600],
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          elevation: 2,
        ),
        child: isLoading
            ? SizedBox(
                height: 20.h,
                width: 20.w,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.update, size: 20.sp),
                  SizedBox(width: 8.w),
                  Text(
                    LocaleKeys.Update.tr(),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}