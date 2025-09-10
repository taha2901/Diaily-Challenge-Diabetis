import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:challenge_diabetes/features/measurments/model/data/get_measurments_models/get_weight_response.dart';

class WeightChartWidget extends StatelessWidget {
  final List<WeightMeasurement> data;

  const WeightChartWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const Center(
        child: Text("لا توجد بيانات كافية للرسم البياني"),
      );
    }

    final weightSpots = data.asMap().entries.map((e) {
      return FlSpot(e.key.toDouble(), e.value.weight.toDouble());
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: weightSpots,
              isCurved: true,
              color: Colors.green,
              barWidth: 2,
              belowBarData: BarAreaData(
                show: true,
                color: Colors.green.withOpacity(0.2),
              ),
              dotData: FlDotData(show: true),
            ),
          ],
          borderData: FlBorderData(show: true),
          titlesData: FlTitlesData(show: false),
        ),
      ),
    );
  }
}