import 'package:challenge_diabetes/core/di/dependency_injection.dart';
import 'package:challenge_diabetes/core/helpers/constants.dart';
import 'package:challenge_diabetes/core/helpers/extentions.dart';
import 'package:challenge_diabetes/core/helpers/shared_pref_helper.dart';
import 'package:challenge_diabetes/core/routings/app_router.dart';
import 'package:challenge_diabetes/doc_app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  setUpGetIt();
  await ScreenUtil.ensureScreenSize();
  await checkLoggedInUser();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) {
        return DocApp(appRouter: AppRouter());
      },
    ),
  );
}

Future<void> checkLoggedInUser() async {
  String? userToken = await SharedPrefHelper.getSecuredString(
    SharedPrefKeys.userToken,
  );
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
