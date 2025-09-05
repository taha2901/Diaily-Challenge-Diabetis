import 'package:challenge_diabetes/core/networking/api_services.dart';
import 'package:challenge_diabetes/core/networking/dio_factory.dart';
import 'package:challenge_diabetes/features/doctor/logic/doctors_cubit.dart';
import 'package:challenge_diabetes/features/doctor/model/repo/doctor_repo.dart';
import 'package:challenge_diabetes/features/login/data/repos/login_repo.dart';
import 'package:challenge_diabetes/features/login/logic/cubit/login_cubit.dart';
import 'package:challenge_diabetes/features/measurments/logic/pressure/pressure_cubit.dart';
import 'package:challenge_diabetes/features/measurments/logic/suger/suger_cubit.dart';
import 'package:challenge_diabetes/features/measurments/logic/weight/weight_cubit.dart';
import 'package:challenge_diabetes/features/measurments/model/repo/pressure_mesurment_repo.dart';
import 'package:challenge_diabetes/features/measurments/model/repo/suger_measurments_repo.dart';
import 'package:challenge_diabetes/features/measurments/model/repo/weight_measurment_repo.dart';
import 'package:challenge_diabetes/features/medicals/logic/medicine_cubit.dart';
import 'package:challenge_diabetes/features/medicals/model/repo/medicine_repo.dart';
import 'package:challenge_diabetes/features/signup/data/repo/sign_up_repo.dart';
import 'package:challenge_diabetes/features/signup/logic/cubit/sign_up_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

Future<void> setUpGetIt() async {
  //dio & ApiServices
  Dio dio = DioFactory.getDio();
  getit.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  //Login
  getit.registerLazySingleton<LoginRepo>(() => LoginRepo(getit()));
  getit.registerFactory<LoginCubit>(() => LoginCubit(getit()));

  //register
  getit.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getit()));
  getit.registerFactory<RegisterCubit>(() => RegisterCubit(getit()));

  //doctors
  getit.registerLazySingleton<DoctorRepo>(() => DoctorRepo(getit()));
  getit.registerFactory<DoctorsCubit>(() => DoctorsCubit(getit()));

  //medicine
  getit.registerLazySingleton<MedicineRepo>(() => MedicineRepo(getit()));
  getit.registerFactory<MedicineCubit>(() => MedicineCubit(getit()));

  //measurements
  getit.registerLazySingleton<MeasurmentRepo>(() => MeasurmentRepo(getit()));
  getit.registerFactory<MeasurmentsCubit>(() => MeasurmentsCubit(getit()));

  //weight
  getit.registerLazySingleton<WeightMeasurmentRepo>(
    () => WeightMeasurmentRepo(getit()),
  );
  getit.registerFactory<WeightCubit>(() => WeightCubit(getit()));

  //pressure
  getit.registerLazySingleton<PressureMeasurmentRepo>(
    () => PressureMeasurmentRepo(getit()),
  );
  getit.registerFactory<PressureCubit>(() => PressureCubit(getit()));

  //profile
  // getit.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getit()));
  // getit.registerFactory<ProfileCubit>(() => ProfileCubit(getit()));

  //exercise
  // getit.registerLazySingleton<ExerciseRepo>(() => ExerciseRepo(getit()));
  // getit.registerFactory<ExerciseCubit>(() => ExerciseCubit(getit()));

  //favourite
  // getit.registerLazySingleton<FavouriteRepo>(() => FavouriteRepo(getit()));
  // getit.registerFactory<FavouriteCubit>(() => FavouriteCubit(getit()));

  //popular doctors
  // getit.registerLazySingleton<PopularDoctorRepo>(() => PopularDoctorRepo(getit()));
  // getit.registerFactory<PopularDoctorsCubit>(() => PopularDoctorsCubit(getit()));

  //medical record
  // getit.registerLazySingleton<MedicalRecordRepo>(() => MedicalRecordRepo(getit()));
  // getit.registerFactory<MedicalRecordCubit>(() => MedicalRecordCubit(getit()));

  //add person
  // getit.registerLazySingleton<AddPersonRepo>(() => AddPersonRepo(getit()));
  // getit.registerFactory<AddPersonCubit>(() => AddPersonCubit(getit(), getit() , getit()));
}
