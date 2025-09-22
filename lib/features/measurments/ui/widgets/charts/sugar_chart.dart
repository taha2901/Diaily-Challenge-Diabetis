import 'package:challenge_diabetes/features/measurments/model/data/get_measurments_models/get_blood_suger_response.dart';
import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SugarChartWidget extends StatelessWidget {
  final List<SugarMeasurement> data;

  const SugarChartWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return Padding(
        padding: EdgeInsets.all(16),
        child: Text(LocaleKeys.no_data_sugar.tr()),
      );
    }

    final List<FlSpot> spots = data.asMap().entries.map((e) {
      return FlSpot(e.key.toDouble(), e.value.sugarReading.toDouble());
    }).toList();

    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(show: true),
            titlesData: FlTitlesData(show: false),
            borderData: FlBorderData(show: true),
            lineBarsData: [
              LineChartBarData(
                isCurved: true,
                color: Colors.redAccent,
                barWidth: 2,
                spots: spots,
                belowBarData: BarAreaData(
                  show: true,
                  color: Colors.redAccent.withOpacity(0.2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
