import 'package:challenge_diabetes/core/di/dependency_injection.dart';
import 'package:challenge_diabetes/core/routings/routers.dart';
import 'package:challenge_diabetes/core/widget/bottom_nav_bar.dart';
import 'package:challenge_diabetes/features/doctor/logic/doctors_cubit.dart';
import 'package:challenge_diabetes/features/doctor/model/data/doctor_response_body.dart';
import 'package:challenge_diabetes/features/doctor/ui/doctor_screen.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor_details_screen.dart';
import 'package:challenge_diabetes/features/login/logic/cubit/login_cubit.dart';
import 'package:challenge_diabetes/features/login/ui/login_screen.dart';
import 'package:challenge_diabetes/features/measurments/ui/measurments_screen.dart';
import 'package:challenge_diabetes/features/medicals/logic/medicine_cubit.dart';
import 'package:challenge_diabetes/features/medicals/model/data/medicine_response_body.dart';
import 'package:challenge_diabetes/features/medicals/ui/add_medicine_screen.dart';
import 'package:challenge_diabetes/features/medicals/ui/edit_medicine_screen.dart';
import 'package:challenge_diabetes/features/medicals/ui/medicals_screen.dart';
import 'package:challenge_diabetes/features/signup/ui/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routers.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getit<LoginCubit>(),
            child: LoginScreen(),
          ),
        );
      case Routers.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routers.bottomNavBar:
        return MaterialPageRoute(builder: (_) => const CustomBottomNavbar());
      case Routers.medicine:
        return MaterialPageRoute(
          builder: (_) => MedicineListScreen(),
        );
      case Routers.editMedicine:
        if (arguments is MedicineResponseBody) {
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => getit<MedicineCubit>(),
              child: EditMedicineScreen(medicine: arguments),
            ),
          );
        }
      case Routers.addMedicine:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getit<MedicineCubit>(),
            child: const AddMedicineScreen(),
          ),
        );

      case Routers.doctors:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getit<DoctorsCubit>()..getDoctors(),
            child: const DoctorsListScreen(),
          ),
        );

      case Routers.doctorDetails:
        if (arguments is DoctorResponseBody) {
          return MaterialPageRoute(
            builder: (_) => DoctorDetailsScreen(doctor: arguments),
          );
        } else {
          return MaterialPageRoute(
            builder: (_) => Scaffold(
              appBar: AppBar(title: const Text('خطأ')),
              body: const Center(
                child: Text(
                  'لم يتم العثور على بيانات الطبيب',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          );
        }

      case Routers.measurement:
        return MaterialPageRoute(builder: (_) => const MeasurementsScreen());

      // يمكنك إضافة الـ routes المعلقة هنا عند الحاجة
      // case Routers.doctorResrvation:
      //   if (arguments is DoctorResponseBody) {
      //     final doctorResponseBody = arguments;
      //     int doctorId = doctorResponseBody.id;
      //     debugPrint('doctorId in routers is: $doctorId');
      //     return MaterialPageRoute(
      //       builder: (_) => DoctorReservation(
      //         doctorId: doctorId,
      //         doctorResponseBody: doctorResponseBody,
      //       ),
      //     );
      //   }
      //   return _errorRoute('بيانات الطبيب مطلوبة');

      // case Routers.confirmDoctorResrvation:
      //   return MaterialPageRoute(
      //     builder: (_) => ConfirmDoctorReservation(),
      //   );

      // case Routers.exercise:
      //   return MaterialPageRoute(
      //     builder: (_) => const ExerciseScreen(),
      //   );

      // case Routers.profile:
      //   return MaterialPageRoute(
      //     builder: (_) => const ProfileScreen(),
      //   );

      // case Routers.updateProfile:
      //   return MaterialPageRoute(
      //     builder: (_) => UpdateUserDataScreen(),
      //   );

      // case Routers.chatbot:
      //   return MaterialPageRoute(
      //     builder: (_) => const MyBot(),
      //   );

      // case Routers.favourite:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => getit<FavouriteCubit>()..getFavourites(),
      //       child: const FavouriteScreen(),
      //     ),
      //   );

      default:
        return null;
    }
    return null;
  }
}
