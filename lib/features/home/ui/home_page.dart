import 'package:challenge_diabetes/core/di/dependency_injection.dart';
import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/core/widget/cutom_app_bar.dart';
import 'package:challenge_diabetes/features/home/ui/widgets/exercise_card.dart';
import 'package:challenge_diabetes/features/home/ui/widgets/medications_card.dart';
import 'package:challenge_diabetes/features/home/ui/widgets/quick_actions_section.dart';
import 'package:challenge_diabetes/features/home/ui/widgets/quick_state_card.dart';
import 'package:flutter/material.dart';

class DiabetesHomePage extends StatelessWidget {
  const DiabetesHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.mainBackGround,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              verticalSpace(10),
              // Quick Stats Card
              QuickStateCard(),
              verticalSpace(20),
    
              // Quick Actions
              QuickActionsSection(),
              verticalSpace(20),
    
              // Medications Reminder
              MedicationsCard(),
              verticalSpace(20),
    
              // Exercise Section
              ExerciseCard(),
            ],
          ),
        ),
      ),
    );
  }
}
