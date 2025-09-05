import 'package:challenge_diabetes/core/networking/api_error_model.dart';
import 'package:challenge_diabetes/features/medicals/model/data/medicine_response_body.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'medicine_state.freezed.dart';

@freezed
class MedicineState with _$MedicineState {
  const factory MedicineState.initial() = _Initial;
  const factory MedicineState.loading() = MedicineLoading;
  const factory MedicineState.success(List<MedicineResponseBody> medicines) = MedicineSuccess;
  const factory MedicineState.error(ApiErrorModel apiErrorModel) = MedicineError;

  const factory MedicineState.addMedicineLoading() = AddMedicineLoading;
  const factory MedicineState.addMedicineSuccess() = AddMedicineSuccess;
  const factory MedicineState.addMedicineError(ApiErrorModel apiErrorModel) = AddMedicineError;

  //delete medicine
  const factory MedicineState.deleteMedicineLoading() = DeleteMedicineLoading;
  const factory MedicineState.deleteMedicineSuccess() = DeleteMedicineSuccess;
  const factory MedicineState.deleteMedicineError(ApiErrorModel apiErrorModel) = DeleteMedicineError;
}
