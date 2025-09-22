import 'package:challenge_diabetes/features/sports/data/model/exercise_response.dart';
import 'package:challenge_diabetes/features/sports/data/repo/exercise_repo.dart';
import 'package:challenge_diabetes/features/sports/logic/exercise_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseCubit extends Cubit<ExerciseState> {
  final ExerciseRepo _exerciseRepo;
  List<Exercise> exercises = [];

  ExerciseCubit(this._exerciseRepo) : super(const ExerciseState.initial());

  static ExerciseCubit get(BuildContext context) =>
      BlocProvider.of<ExerciseCubit>(context);

  void getExercise() async {
    emit(const ExerciseState.loading());

    final response = await _exerciseRepo.getExercise();
    response.when(
      success: (exercise) {
        exercises = exercise;
        emit(const ExerciseState.success());
      },
      failure: (errorModel) {
        emit(ExerciseState.error(errorModel)); 
      },
    );
  }
}
