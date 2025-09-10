import 'package:challenge_diabetes/features/measurments/logic/pressure/pressure_cubit.dart';
import 'package:challenge_diabetes/features/measurments/logic/pressure/pressure_state.dart';
import 'package:challenge_diabetes/features/measurments/model/data/get_measurments_models/get_blood_pressure_response.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/charts/pressure_chart.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/cards/pressure_card.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/common/empty_state_widget.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/common/error_state_widget.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/common/loading_state_widget.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/common/measurement_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PressureTab extends StatelessWidget {
  final String selectedDate;

  const PressureTab({super.key, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PressureCubit, PressureState>(
      builder: (context, state) {
        return state.maybeWhen(
          getBloodPressureLoading: () => const LoadingStateWidget(),
          getBloodPressureSuccess: (bloodPressure, heartRate) {
            if (bloodPressure.isEmpty) {
              return EmptyStateWidget(
                icon: Icons.favorite,
                message: 'لا توجد قراءات ضغط حالياً',
                onRefresh: () => context
                    .read<PressureCubit>()
                    .fetchPressureData(selectedDate),
              );
            }

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
