import 'package:challenge_diabetes/features/measurments/logic/pressure/pressure_cubit.dart';
import 'package:challenge_diabetes/features/measurments/logic/pressure/pressure_state.dart';
import 'package:challenge_diabetes/features/measurments/logic/suger/suger_cubit.dart';
import 'package:challenge_diabetes/features/measurments/model/data/get_measurments_models/get_blood_pressure_response.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/charts/pressure_chart.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/cards/pressure_card.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/common/empty_state_widget.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/common/error_state_widget.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/common/loading_state_widget.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/common/measurement_content_widget.dart';
import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PressureTab extends StatefulWidget {
  final String selectedDate;

  const PressureTab({super.key, required this.selectedDate});

  @override
  State<PressureTab> createState() => _PressureTabState();
}

class _PressureTabState extends State<PressureTab> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PressureCubit, PressureState>(
      builder: (context, state) {
        return state.maybeWhen(
          getBloodPressureLoading: () => const LoadingStateWidget(),
          getBloodPressureEmpty: () => EmptyStateWidget(
            icon: Icons.bloodtype,
            message: LocaleKeys.dont_exist_pressure_date.tr(),
            onRefresh: () =>
                context.read<PressureCubit>().fetchPressureData(widget.selectedDate),
          ),
          getBloodPressureSuccess: (bloodPressure, heartRate) {
            return MeasurementContentWidget(
              chart: PressureChartWidget(data: bloodPressure),
              items: _buildPressureCards(bloodPressure),
            );
          },
          getBloodPressureError: () => const ErrorStateWidget(),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  List<Widget> _buildPressureCards(List<BloodPressureMeasurement> readings) {
    return readings.map((reading) => PressureCard(reading: reading)).toList();
  }
}
