import 'package:challenge_diabetes/features/measurments/logic/suger/suger_cubit.dart';
import 'package:challenge_diabetes/features/measurments/logic/suger/suger_state.dart';
import 'package:challenge_diabetes/features/measurments/model/data/get_measurments_models/get_blood_suger_response.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/charts/sugar_chart.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/cards/suger_card.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/common/empty_state_widget.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/common/error_state_widget.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/common/loading_state_widget.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/common/measurement_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SugarTab extends StatelessWidget {
  final String selectedDate;

  const SugarTab({
    super.key,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MeasurmentsCubit, MeasurmentsState>(
      builder: (context, state) {
        return state.maybeWhen(
          getBloodSugerLoading: () => const LoadingStateWidget(),
          getBloodSugerSuccess: (bloodSugar) {
            if (bloodSugar.isEmpty) {
              return EmptyStateWidget(
                icon: Icons.bloodtype,
                message: 'لا توجد قراءات سكر حالياً',
                onRefresh: () => context.read<MeasurmentsCubit>().fetchSugarData(selectedDate),
              );
            }
            
            return MeasurementContentWidget(
              chart: SugarChartWidget(data: bloodSugar),
              items: _buildSugarCards(bloodSugar),
            );
          },
          getBloodSugerError: (error) => const ErrorStateWidget(),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  List<Widget> _buildSugarCards(List<SugarMeasurement> readings) {
    return readings
        .map((reading) => SugarCard(reading: reading))
        .toList();
  }
}