import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/features/doctor/logic/doctors_cubit.dart';
import 'package:challenge_diabetes/features/doctor/logic/doctors_state.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor/search_bar_widget.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor/state_card_loading.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor/states_card_error.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor/states_card_initial.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor/states_card_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeadersInfoDoctor extends StatelessWidget {
  const HeadersInfoDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ColorsManager.mainBlue,
            ColorsManager.mainBlue.withOpacity(0.8),
          ],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorsManager.mainBlue.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
        child: Column(
          children: [
            const SearchBarWidget(),
            verticalSpace(20),
            BlocBuilder<DoctorsCubit, DoctorsState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => const ModernStatsCardInitial(),
                  initial: () => const ModernStatsCardInitial(),
                  doctorLoading: () => const ModernStatsCardLoading(),
                  doctorSuccess: (doctors) => ModernStatsCardSuccess(doctors: doctors),
                  doctorError: (error) => const ModernStatsCardError(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}