import 'package:challenge_diabetes/core/networking/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_state.freezed.dart';

@freezed
class ExerciseState with  _$ExerciseState  {
  const factory ExerciseState.initial() = _Initial;
  const factory ExerciseState.loading() =   ExerciseLoading;
  const factory ExerciseState.success() =  ExerciseSuccess;
  const factory ExerciseState.error(ApiErrorModel apiErrorModel) = ExerciseError;

}
