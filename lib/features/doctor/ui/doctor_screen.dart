import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/core/widget/custom_app_bar_doctors.dart';
import 'package:challenge_diabetes/features/doctor/model/data/doctor_response_body.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor/doctor_card.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor/empty_search_widget.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor/search_bar_widget.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor/states_card_error.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor/states_card_loading.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor/states_card_success.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor/doctor_error_retry_model.dart';
import 'package:challenge_diabetes/features/doctor/logic/doctors_cubit.dart';
import 'package:challenge_diabetes/features/doctor/logic/doctors_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/doctor/states_card_initial.dart';

class DoctorsListScreen extends StatefulWidget {
  const DoctorsListScreen({super.key});

  @override
  State<DoctorsListScreen> createState() => _DoctorsListScreenState();
}

class _DoctorsListScreenState extends State<DoctorsListScreen> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.mainBackGround,
      body: Column(
        children: [
          const CustomAppBarForDoctors(title: 'الأطباء المتخصصين'),
          // Header with statistics
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorsManager.mainBlue,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                children: [
                  // Search Bar
                  SearchBarWidget(),
                  // Statistics with BlocBuilder
                  BlocBuilder<DoctorsCubit, DoctorsState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => const StatesCardInitial(),
                        initial: () => StatesCardInitial(),
                        doctorLoading: () => StatesCardLoading(),
                        doctorSuccess: (doctors) {
                          return SatatesCardSuccess(doctors: doctors);
                        },
                        doctorError: (error) => StatesCardError(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<DoctorsCubit, DoctorsState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () =>
                      const Center(child: CircularProgressIndicator()),
                  initial: () => const Center(child: Text('لا توجد بيانات')),
                  doctorLoading: () =>
                      const Center(child: CircularProgressIndicator()),
                  doctorSearch: (filtered) {
                    if (filtered.isEmpty) {
                      return EmptySearchWidget();
                    }
                    return buildDoctorsList(filtered, context);
                  },

                  doctorSuccess: (doctors) {
                    final cubit = context.read<DoctorsCubit>();
                    if (cubit.filteredDoctors.isEmpty) {
                      return EmptySearchWidget();
                    }

                    return RefreshIndicator(
                      onRefresh: () async {
                        context.read<DoctorsCubit>().getDoctors();
                      },
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: 8.h, bottom: 20.h),
                        itemCount: cubit.filteredDoctors.length,
                        itemBuilder: (context, index) {
                          final doctor = cubit.filteredDoctors[index];
                          return DoctorCard(doctor: doctor);
                        },
                      ),
                    );
                  },
                  doctorError: (error) => DoctorErrorRetryWidget(error: error),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

 Widget buildDoctorsList(List<DoctorResponseBody> doctors, BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<DoctorsCubit>().getDoctors();
      },
      child: ListView.builder(
        padding: EdgeInsets.only(top: 8.h, bottom: 20.h),
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return DoctorCard(doctor: doctor);
        },
      ),
    );
  }

