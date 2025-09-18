
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor/state_card.dart';
import 'package:flutter/material.dart';

class StatesCardError extends StatelessWidget {
  const StatesCardError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        StateCard(title: 'إجمالي الأطباء', value: 'خطأ'),
        StateCard(title: 'متاحين الآن', value: 'خطأ'),
        StateCard(title: 'متوسط التقييم', value: 'خطأ'),
      ],
    );
  }
}
