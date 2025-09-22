import 'package:challenge_diabetes/core/helpers/constants.dart';
import 'package:challenge_diabetes/features/measurments/model/data/get_measurments_models/get_weight_response.dart';
import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class WeightCard extends StatelessWidget {
  final WeightMeasurement weight;

  const WeightCard({super.key, required this.weight});

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
        color: const Color(0xFF10B981).withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(Icons.monitor_weight, color: Color(0xFF10B981), size: 20),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // الوزن
        Text(
          "${LocaleKeys.weight.tr()}: ${weight.weight} ${LocaleKeys.kg.tr()}",
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        const SizedBox(height: 4),
        // النشاط
        Text(
          "${LocaleKeys.activity.tr()}: "
          "${weight.sport ? LocaleKeys.activity_walk.tr() : LocaleKeys.activity_other.tr()}",
          style: TextStyle(color: Colors.grey[600], fontSize: 13),
        ),
      ],
    );
  }

  Widget _buildTime() {
    return Text(
      DateHelper.formatDateTime(weight.dateTime),
      style: TextStyle(fontSize: 11, color: Colors.grey[500]),
    );
  }
}
