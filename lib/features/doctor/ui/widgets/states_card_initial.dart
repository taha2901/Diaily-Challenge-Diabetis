
import 'package:challenge_diabetes/features/doctor/ui/widgets/state_card.dart';
import 'package:flutter/material.dart';

class StatesCardInitial extends StatelessWidget {
  const StatesCardInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        StateCard(title: 'إجمالي الأطباء', value: '0'),
        StateCard(title: 'متاحين الآن', value: '0'),
        StateCard(title: 'متوسط التقييم', value: '0.0'),
      ],
    );
  }
}
