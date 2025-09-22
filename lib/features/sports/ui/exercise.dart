import 'package:challenge_diabetes/core/di/dependency_injection.dart';
import 'package:challenge_diabetes/features/sports/logic/exercise_cubit.dart';
import 'package:challenge_diabetes/features/sports/logic/exercise_state.dart';
import 'package:challenge_diabetes/features/sports/ui/widgets/app_bar_exercise.dart';
import 'package:challenge_diabetes/features/sports/ui/widgets/exercise_card.dart' show ExerciseCard;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart'; 

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarOfExcercise(),
            Expanded(
              child: BlocProvider(
                create: (context) => getit<ExerciseCubit>()..getExercise(),
                child: BlocConsumer<ExerciseCubit, ExerciseState>(
                  listener: (context, state) {
                   
                  },
                  builder: (context, state) {
                    if (state is ExerciseLoading) {
                      return ListView.builder(
                        itemCount: 5, 
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Skeletonizer(
                              enabled: true,
                              child: Container(
                                height: 100,
                                width: double.infinity,
                                color: Colors.grey[300], // لون placeholder
                              ),
                            ),
                          );
                        },
                      );
                    } else if (state is ExerciseSuccess) {
                      final exercises = ExerciseCubit.get(context).exercises;
                      return ListView.builder(
                        itemCount: exercises.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ExerciseCard(
                              exercise: exercises[index],
                            ),
                          );
                        },
                      );
                    } else if (state is ExerciseError) {
                      // عرض رسالة خطأ في حالة الفشل
                      return Center(
                        child: Text('حدث خطأ أثناء جلب البيانات'),
                      );
                    }
                    // عرض مؤشر تحميل أو رسالة مبدئية في حالة `initial`
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
