import 'package:challenge_diabetes/core/di/dependency_injection.dart';
import 'package:challenge_diabetes/core/helpers/constants.dart';
import 'package:challenge_diabetes/core/routings/app_router.dart';
import 'package:challenge_diabetes/core/routings/routers.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/features/checkout_payment/data/repos/checkout_repo_impl.dart';
import 'package:challenge_diabetes/features/checkout_payment/presentation/manger/payment_cubit.dart';
import 'package:challenge_diabetes/features/doctor/logic/doctors_cubit.dart';
import 'package:challenge_diabetes/features/measurments/logic/pressure/pressure_cubit.dart';
import 'package:challenge_diabetes/features/measurments/logic/suger/suger_cubit.dart';
import 'package:challenge_diabetes/features/measurments/logic/weight/weight_cubit.dart';
import 'package:challenge_diabetes/features/medicals/logic/medicine_cubit.dart';
import 'package:challenge_diabetes/features/signup/logic/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart' as easy_localization;

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
            BlocProvider(
              create: (context) => getit<MedicineCubit>()..getMedicine(),
            ),
            BlocProvider(create: (_) => getit<MeasurmentsCubit>()),
            BlocProvider(create: (_) => getit<PressureCubit>()),
            BlocProvider(create: (_) => getit<WeightCubit>()),
            BlocProvider(create: (_) => getit<DoctorsCubit>()),
          BlocProvider(
              create: (_) => PaymenttCubit(CheckoutRepoImpl()),
            ),
          ],
          child: MaterialApp(
            builder: (context, child) => Directionality(
              textDirection: context.locale.languageCode == 'ar'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              child: DevicePreview.appBuilder(context, child),
            ),
            title: 'Daily Challenge Diabetes App',
            theme: ThemeData(
              primaryColor: ColorsManager.mainBlue,
              scaffoldBackgroundColor: Colors.white,
              useMaterial3: true,
            ),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            initialRoute: isLoggedInUser ? Routers.bottomNavBar : Routers.login,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: appRouter.generateRoute,
          ),
        );
      },
    );
  }
}