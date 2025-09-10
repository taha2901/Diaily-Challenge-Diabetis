import 'package:flutter/material.dart';

class MeasurementContentWidget extends StatelessWidget {
  final Widget chart;
  final List<Widget> items;

  const MeasurementContentWidget({
    super.key,
    required this.chart,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        _buildChartContainer(),
        const SizedBox(height: 16),
        _buildItemsList(),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildChartContainer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "الرسم البياني",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(height: 180, child: chart),
        ],
      ),
    );
  }

  Widget _buildItemsList() {
    return Expanded(
      child: items.isEmpty
          ? const Center(child: Text("لا توجد بيانات"))
          : ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: items.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (_, index) => items[index],
            ),
    );
  }
}