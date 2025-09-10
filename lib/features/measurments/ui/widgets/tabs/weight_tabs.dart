import 'package:challenge_diabetes/features/measurments/logic/weight/weight_cubit.dart';
import 'package:challenge_diabetes/features/measurments/logic/weight/weight_state.dart';
import 'package:challenge_diabetes/features/measurments/model/data/get_measurments_models/get_weight_response.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/charts/weight_chart.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/common/empty_state_widget.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/common/error_state_widget.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/common/loading_state_widget.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/common/measurement_content_widget.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/cards/weight_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class WeightTab extends StatelessWidget {
  final String selectedDate;

  const WeightTab({
    super.key,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeightCubit, WeightState>(
      builder: (context, state) {
        return state.maybeWhen(
          getWeightLoading: () => const LoadingStateWidget(),
          getWeightSuccess: (weightMeasurements) {
            if (weightMeasurements.isEmpty) {
              return EmptyStateWidget(
                icon: Icons.monitor_weight,
                message: 'لا توجد قراءات وزن حالياً',
                onRefresh: () => context.read<WeightCubit>().fetchWeightData(selectedDate),
              );
            }
            
            return MeasurementContentWidget(
              chart: WeightChartWidget(data: weightMeasurements),
              items: _buildWeightCards(weightMeasurements),
            );
          },
          getWeightError: (error) => const ErrorStateWidget(),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  List<Widget> _buildWeightCards(List<WeightMeasurement> weights) {
    return weights
        .map((weight) => WeightCard(weight: weight))
        .toList();
  }
}