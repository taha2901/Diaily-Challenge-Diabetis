
import 'package:challenge_diabetes/core/networking/api_error_handler.dart';
import 'package:challenge_diabetes/core/networking/api_result.dart';
import 'package:challenge_diabetes/core/networking/api_services.dart';
import 'package:challenge_diabetes/features/sports/data/model/exercise_response.dart';

class ExerciseRepo {
  final ApiServices _apiService;
  ExerciseRepo(this._apiService);

  Future<ApiResult<List<Exercise>>> getExercise() async {
    try {
      final response = await _apiService.gerExercise();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error),);
    }
  }

  
}
