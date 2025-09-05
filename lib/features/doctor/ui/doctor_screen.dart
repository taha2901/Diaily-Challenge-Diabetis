import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/core/widget/custom_app_bar_doctors.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor_error_retry_model.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/empty_search_widget.dart';
import 'package:challenge_diabetes/features/doctor/logic/doctors_cubit.dart';
import 'package:challenge_diabetes/features/doctor/logic/doctors_state.dart';
import 'package:challenge_diabetes/features/doctor/model/data/doctor_response_body.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/states_card_error.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/states_card_initial.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/states_card_loading.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/states_card_success.dart';
import 'package:flutter/material.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsListScreen extends StatefulWidget {
  const DoctorsListScreen({super.key});

  @override
  State<DoctorsListScreen> createState() => _DoctorsListScreenState();
}

class _DoctorsListScreenState extends State<DoctorsListScreen> {
  String searchQuery = '';
  List<DoctorResponseBody> filteredDoctors = [];

  void _filterDoctors(List<DoctorResponseBody> allDoctors) {
    filteredDoctors = allDoctors.where((doctor) {
      final matchesSearch =
          searchQuery.isEmpty ||
          doctor.userName.toLowerCase().contains(searchQuery.toLowerCase()) ||
          doctor.doctorspecialization.toLowerCase().contains(
            searchQuery.toLowerCase(),
          );

      return matchesSearch;
    }).toList();
  }

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
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'ابحث عن طبيب...',
                        prefixIcon: Icon(
                          Icons.search,
                          color: ColorsManager.mainBlue,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 15.h,
                        ),
                      ),
                    ),
                  ),
                  // Statistics with BlocBuilder
                  BlocBuilder<DoctorsCubit, DoctorsState>(
                    builder: (context, state) {
                      return state.when(
                        initial: () => StatesCardInitial(),
                        doctorLoading: () => StatesCardLoading(),
                        doctorSuccess: (doctors) {
                          return SatatesCardSuccess(
                            doctors: doctors,
                          );
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
                return state.when(
                  initial: () => const Center(child: Text('لا توجد بيانات')),
                  doctorLoading: () =>
                      const Center(child: CircularProgressIndicator()),
                  doctorSuccess: (doctors) {
                    _filterDoctors(doctors);

                    if (filteredDoctors.isEmpty) {
                      return EmptySearchWidget();
                    }

                    return RefreshIndicator(
                      onRefresh: () async {
                        context.read<DoctorsCubit>().getDoctors();
                      },
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: 8.h, bottom: 20.h),
                        itemCount: filteredDoctors.length,
                        itemBuilder: (context, index) {
                          final doctor = filteredDoctors[index];
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
