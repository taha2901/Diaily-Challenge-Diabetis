import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:challenge_diabetes/features/measurments/model/data/get_measurments_models/get_blood_pressure_response.dart';

class PressureChartWidget extends StatefulWidget {
  final List<BloodPressureMeasurement> data;

  const PressureChartWidget({super.key, required this.data});

  @override
  State<PressureChartWidget> createState() => _PressureChartWidgetState();
}

class _PressureChartWidgetState extends State<PressureChartWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.data.isEmpty) {
      return Center(child: Text(LocaleKeys.no_data.tr()));
    }

    final systolicSpots = widget.data.asMap().entries.map((e) {
      return FlSpot(e.key.toDouble(), e.value.systolicPressure.toDouble());
    }).toList();

    final diastolicSpots = widget.data.asMap().entries.map((e) {
      return FlSpot(e.key.toDouble(), e.value.diastolicPressure.toDouble());
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _LegendItem(
                color: Colors.redAccent,
                text: LocaleKeys.systolic_pressure.tr(),
              ),
              const SizedBox(width: 16),
              _LegendItem(
                color: Colors.orange,
                text: LocaleKeys.diastolic_pressure.tr(),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    spots: systolicSpots,
                    isCurved: true,
                    color: Colors.redAccent,
                    barWidth: 2,
                    dotData: FlDotData(show: true),
                  ),
                  LineChartBarData(
                    spots: diastolicSpots,
                    isCurved: true,
                    color: Colors.orange,
                    barWidth: 2,
                    dotData: FlDotData(show: true),
                  ),
                ],
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) => Text(
                        value.toInt().toString(),
                        style: const TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) => Text(
                        "${LocaleKeys.measurement.tr()} ${value.toInt() + 1}", // ✅ متعدد اللغات
                        style: const TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                extraLinesData: ExtraLinesData(
                  horizontalLines: [
                    HorizontalLine(
                      y: 120,
                      color: Colors.green,
                      strokeWidth: 1,
                      dashArray: [5, 5],
                      label: HorizontalLineLabel(
                        show: true,
                        alignment: Alignment.topRight,
                        labelResolver: (_) => "120 (${LocaleKeys.normal.tr()})",
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    HorizontalLine(
                      y: 80,
                      color: Colors.blue,
                      strokeWidth: 1,
                      dashArray: [5, 5],
                      label: HorizontalLineLabel(
                        show: true,
                        alignment: Alignment.topRight,
                        labelResolver: (_) => "80 (${LocaleKeys.normal.tr()})",
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  const _LegendItem({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 12, height: 12, color: color),
        const SizedBox(width: 6),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
