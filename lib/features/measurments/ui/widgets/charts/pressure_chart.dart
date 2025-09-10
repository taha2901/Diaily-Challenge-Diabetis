import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:challenge_diabetes/features/measurments/model/data/get_measurments_models/get_blood_pressure_response.dart';

class PressureChartWidget extends StatelessWidget {
  final List<BloodPressureMeasurement> data;

  const PressureChartWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const Center(
        child: Text("لا توجد بيانات كافية للرسم البياني"),
      );
    }

    final systolicSpots = data.asMap().entries.map((e) {
      return FlSpot(e.key.toDouble(), e.value.systolicPressure.toDouble());
    }).toList();

    final diastolicSpots = data.asMap().entries.map((e) {
      return FlSpot(e.key.toDouble(), e.value.diastolicPressure.toDouble());
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: systolicSpots,
              isCurved: true,
              color: Colors.redAccent,
              barWidth: 2,
              belowBarData: BarAreaData(show: false),
              dotData: FlDotData(show: true),
            ),
            LineChartBarData(
              spots: diastolicSpots,
              isCurved: true,
              color: Colors.orange,
              barWidth: 2,
              belowBarData: BarAreaData(show: false),
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