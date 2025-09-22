import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/features/doctor/logic/doctors_cubit.dart';
import 'package:challenge_diabetes/features/doctor/model/data/doctor_response_body.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorList extends StatelessWidget {
  final List<DoctorResponseBody> doctors;
  const DoctorList({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<DoctorsCubit>().getDoctors();
      },
      color: ColorsManager.mainBlue,
      backgroundColor: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 20.h),
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 300 + (index * 100)),
            curve: Curves.easeOutBack,
            child: DoctorCard(doctor: doctors[index], index: index),
          );
        },
      ),
    );
  }
}