import 'package:challenge_diabetes/core/di/dependency_injection.dart';
import 'package:challenge_diabetes/core/helpers/constants.dart';
import 'package:challenge_diabetes/core/routings/app_router.dart';
import 'package:challenge_diabetes/core/routings/routers.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/features/medicals/logic/medicine_cubit.dart';
import 'package:challenge_diabetes/features/signup/logic/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';

class DocApp extends StatelessWidget {
  final AppRouter appRouter;
  const DocApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => getit<RegisterCubit>()),
            BlocProvider(create: (context) => getit<MedicineCubit>()..getMedicine()),
          ],
          child: MaterialApp(
            builder: DevicePreview.appBuilder,
            title: 'Doc App',
            theme: ThemeData(
              primaryColor: ColorsManager.mainBlue,
              scaffoldBackgroundColor: Colors.white,
              useMaterial3: true,
            ),
            initialRoute: isLoggedInUser ? Routers.bottomNavBar : Routers.login,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: appRouter.generateRoute,
          ),
        );
      },
    );
  }
}
