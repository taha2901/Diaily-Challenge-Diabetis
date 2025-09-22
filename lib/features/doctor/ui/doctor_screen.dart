import 'package:challenge_diabetes/core/widget/custom_app_bar_doctors.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor/doctor_list.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor/empty_doc_list.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor/empty_search_widget.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor/headers_info_doctor.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor/doctor_error_retry_model.dart';
import 'package:challenge_diabetes/features/doctor/logic/doctors_cubit.dart';
import 'package:challenge_diabetes/features/doctor/logic/doctors_state.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor/shimmer_load_doctor.dart';
import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsListScreen extends StatefulWidget {
  const DoctorsListScreen({super.key});

  @override
  State<DoctorsListScreen> createState() => _DoctorsListScreenState();
}

class _DoctorsListScreenState extends State<DoctorsListScreen>
    with SingleTickerProviderStateMixin {
  String searchQuery = '';
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFB),
      body: Column(
        children: [
           CustomAppBarForDoctors(title: LocaleKeys.specialized_doctors.tr()),

          HeadersInfoDoctor(),

          // قائمة الأطباء
          Expanded(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: BlocBuilder<DoctorsCubit, DoctorsState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => ShimmerLoadDoctor(),
                    initial: () => EmptyDocList(),
                    doctorLoading: () => ShimmerLoadDoctor(),
                    doctorSearch: (filtered) {
                      if (filtered.isEmpty) {
                        return const EmptySearchWidget();
                      }
                      return DoctorList(doctors:  filtered);
                    },
                    doctorSuccess: (doctors) {
                      final cubit = context.read<DoctorsCubit>();
                      if (cubit.filteredDoctors.isEmpty) {
                        return const EmptySearchWidget();
                      }
                      return DoctorList(doctors:  cubit.filteredDoctors);
                    },
                    doctorError: (error) =>
                        DoctorErrorRetryWidget(error: error),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
