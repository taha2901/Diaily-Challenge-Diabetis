
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor/state_card.dart';
import 'package:flutter/material.dart';

class StatesCardLoading extends StatelessWidget {
  const StatesCardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        StateCard(title: 'إجمالي الأطباء', value: '...'),
        StateCard(title: 'متاحين الآن', value: '...'),
        StateCard(title: 'متوسط التقييم', value: '...'),
      ],
    );
  }
}
