import 'package:challenge_diabetes/core/helpers/constants.dart';
import 'package:challenge_diabetes/features/measurments/model/data/get_measurments_models/get_blood_suger_response.dart';
import 'package:flutter/material.dart';

class SugarCard extends StatelessWidget {
  final SugarMeasurement reading;

  const SugarCard({super.key, required this.reading});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildIcon(),
          const SizedBox(width: 16),
          Expanded(child: _buildContent()),
          _buildTime(),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(Icons.bloodtype, color: Colors.red, size: 20),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "القراءة: ${reading.sugarReading} mg/dL",
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        const SizedBox(height: 4),
        Text(
          "التوقيت: ${reading.measurementDate}",
          style: TextStyle(color: Colors.grey[600], fontSize: 13),
        ),
      ],
    );
  }

  Widget _buildTime() {
    return Text(
      DateHelper.formatDateTime(reading.dateTime),
      style: TextStyle(fontSize: 11, color: Colors.grey[500]),
    );
  }
}