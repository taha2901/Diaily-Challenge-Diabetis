import 'package:challenge_diabetes/core/networking/api_error_model.dart';
import 'package:challenge_diabetes/features/doctor/model/data/available_time_response.dart';
import 'package:challenge_diabetes/features/doctor/model/data/delete_reservaion_response.dart';
import 'package:challenge_diabetes/features/doctor/model/data/doctor_response_body.dart';
import 'package:challenge_diabetes/features/doctor/model/data/reservation_response_body.dart';
import 'package:challenge_diabetes/features/doctor/model/data/user_reservations_response_body.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctors_state.freezed.dart';

@freezed
class DoctorsState with _$DoctorsState {
  const factory DoctorsState.initial() = _Initial;
  const factory DoctorsState.doctorLoading() = DoctorLoading;
  const factory DoctorsState.doctorSuccess({
    required List<DoctorResponseBody> doctor,
  }) = DoctorSuccess;
  const factory DoctorsState.doctorError(ApiErrorModel apiErrorModel) =
      DoctorError;

  const factory DoctorsState.reservationLoading() = ReservationLoading;
  const factory DoctorsState.reservationSuccess({
    required ReservationResponseBody reservationResponse,
  }) = ReservationSuccess;
  const factory DoctorsState.reservationError(ApiErrorModel apiErrorModel) =
      ReservationError;

  //delete reservation
  const factory DoctorsState.deleteReservationLoading() =
      DeleteReservationLoading;
  const factory DoctorsState.deleteReservationSuccess({
    required DeleteReservaionResponse deleteReservaionResponse,
  }) = DeleteReservationSuccess;
  const factory DoctorsState.deleteReservationError(
    ApiErrorModel apiErrorModel,
  ) = DeleteReservationError;

  //available time
  const factory DoctorsState.availableTimeLoading() = AvailableTimeLoading;
  const factory DoctorsState.availableTimeSuccess({
    required AvailableTimesResponse availableTimeResponse,
  }) = AvailableTimeSuccess;
  const factory DoctorsState.availableTimeError(ApiErrorModel apiErrorModel) =
      AvailableTimeError;

  // user reservation
  const factory DoctorsState.userReservationLoading() = UserReservationLoading;
  const factory DoctorsState.userReservationSuccess({
    required List<ReservationModel> reservations,
  }) = UserReservationSuccess;
  const factory DoctorsState.userReservationError(ApiErrorModel apiErrorModel) =
      UserReservationError;

  const factory DoctorsState.doctorSearch({
    required List<DoctorResponseBody> filteredDoctors,
  }) = DoctorSearch;
}
