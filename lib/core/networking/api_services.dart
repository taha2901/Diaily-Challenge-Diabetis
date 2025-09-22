import 'package:challenge_diabetes/features/doctor/model/data/available_time_response.dart';
import 'package:challenge_diabetes/features/doctor/model/data/delete_reservaion_response.dart';
import 'package:challenge_diabetes/features/doctor/model/data/doctor_response_body.dart';
import 'package:challenge_diabetes/features/doctor/model/data/reservation_request_body.dart';
import 'package:challenge_diabetes/features/doctor/model/data/reservation_response_body.dart';
import 'package:challenge_diabetes/features/doctor/model/data/user_reservations_response_body.dart';
import 'package:challenge_diabetes/features/login/data/models/login_request_body.dart';
import 'package:challenge_diabetes/features/login/data/models/login_response_body.dart';
import 'package:challenge_diabetes/features/measurments/model/data/add_measurments_models/blood_pressure_request_model.dart';
import 'package:challenge_diabetes/features/measurments/model/data/add_measurments_models/blood_pressure_response_model.dart';
import 'package:challenge_diabetes/features/measurments/model/data/add_measurments_models/blood_suger_request_model.dart';
import 'package:challenge_diabetes/features/measurments/model/data/add_measurments_models/blood_suger_response_model.dart';
import 'package:challenge_diabetes/features/measurments/model/data/add_measurments_models/weight_request_model.dart';
import 'package:challenge_diabetes/features/measurments/model/data/add_measurments_models/weight_response_model.dart';
import 'package:challenge_diabetes/features/measurments/model/data/get_measurments_models/get_blood_pressure_response.dart';
import 'package:challenge_diabetes/features/measurments/model/data/get_measurments_models/get_blood_suger_response.dart';
import 'package:challenge_diabetes/features/measurments/model/data/get_measurments_models/get_weight_response.dart';
import 'package:challenge_diabetes/features/medicals/model/data/add_medicine_request_body.dart';
import 'package:challenge_diabetes/features/medicals/model/data/add_medicine_response_body.dart';
import 'package:challenge_diabetes/features/medicals/model/data/delete_medicine_response_body.dart';
import 'package:challenge_diabetes/features/medicals/model/data/medicine_response_body.dart';
import 'package:challenge_diabetes/features/profile/data/models/update_user_request.dart';
import 'package:challenge_diabetes/features/profile/data/models/update_user_response.dart';
import 'package:challenge_diabetes/features/profile/data/models/user_details_response.dart';
import 'package:challenge_diabetes/features/signup/data/models/sign_up_response.dart';
import 'package:challenge_diabetes/features/sports/data/model/exercise_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'api_constants.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @POST(ApiConstants.login)
  Future<LoginResponseBody> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.register)
  Future<RegisterResponseBody> register(@Body() FormData formData);

  @GET(ApiConstants.doctor)
  Future<List<DoctorResponseBody>> getDoctors();

  @GET(ApiConstants.medicines)
  Future<List<MedicineResponseBody>> getMedicine();

  @POST(ApiConstants.addMedicine)
  Future<AddMedicineResponseBody> addMedicine(
    @Body() AddMedicineRequestBody addMedicineRequestBody,
  );

  @DELETE(ApiConstants.deleteMedicine)
  Future<DeleteMedicineResponse> deleteMedicine(@Query("id") int id);

  @POST(ApiConstants.reservation)
  Future<ReservationResponseBody> addReservation(
    @Query("id") int id,
    @Body() ReservationRequestBody reservationRequestBody,
  );

  @DELETE(ApiConstants.cancelReservation)
  Future<DeleteReservaionResponse> cancelReservation(@Query("id") int id);

  @POST(ApiConstants.bloodSugar)
  Future<BloodSugerResponseBody> addBloodSugar(
    @Body() BloodSugerRequestBody addMedicineRequestBody,
  );

  @POST(ApiConstants.bloodPressure)
  Future<BloodPressureResponseBody> addBloodPressure(
    @Body() BloodPressureRequestBody addMedicineRequestBody,
  );
  @POST(ApiConstants.weight)
  Future<WeightResponseBody> addWeight(
    @Body() WeightRequestBody addMedicineRequestBody,
  );
  @GET(ApiConstants.getBloodSuger)
  Future<List<SugarMeasurement>> getBloodSuger(
    @Query('specificDate') String specificDate,
  );

  @GET(ApiConstants.getWeight)
  Future<List<WeightMeasurement>> getWeight(
    @Query('specificDate') String specificDate,
  );

  @GET(ApiConstants.getPressure)
  Future<List<BloodPressureMeasurement>> getPressure(
    @Query('specificDate') String specificDate,
  );

  @GET(ApiConstants.availableTime)
  Future<AvailableTimesResponse> getAvailableTime(
    @Query("id") int id,
    @Query("date") String date,
  );

  @GET(ApiConstants.userReservations)
  Future<UserReservationsResponseBody> getUserReservations();

  // @GET(ApiConstants.popularDoctor)
  // Future<List<PopularDoctorResponseBody>> getPopularDoctor();

  @GET(ApiConstants.settings)
  Future<UserDetailsResponse> getProfile();

  @PUT(ApiConstants.updateProfile)
  Future<UpdateUserResponse> updateProfile(
    @Body() UpdateUserRequest updateProfileRequestModel,
  );
  
  //   @POST(ApiConstants.logout)
  // Future<void> logout();

  @GET(ApiConstants.getExercise)
  Future<List<Exercise>> gerExercise();

  // @GET(ApiConstants.getFavourite)
  // Future<List<FavouriteDoctorResponse>> getFavourite();

  // @POST(ApiConstants.addFavourite)
  // Future<AddOrRemoveFavouriteResponseModel> addOrRemoveFavourite(
  //   @Body() AddOrRemoveFavouriteRequestModel addDoctorRequest,
  // );

  // @GET(ApiConstants.medicalRecord)
  // Future<MedicalRecord> getMedicalRecord();

  // @GET(ApiConstants.deleteMedicalRecord)
  // Future<DeleteMedicalRecord> deleteMedicalRecord();

  // @POST(ApiConstants.addPerson)
  // Future<AddPersonModel> addPerson(
  //   @Query("email") String id,
  //   @Query("phone") String date,
  //   @Query("relvant_relation") String relvantRelation,
  // );

  // @GET(ApiConstants.getDoctorComments)
  // Future<List<DoctorCommentResponse>> getComments(
  //     @Query("doctorId") int doctorId);

  // //doctorId as a query parameter

  // @POST(ApiConstants.addDoctorComment)
  // Future<AddCommentResponseBody> addComment(
  //   @Query("doctorId") int doctorId,
  //   @Body() AddCommentRequestBody addCommentRequestBody,
  // );

  // @POST(ApiConstants.addRate)
  // Future<AddRateResponse> addRate(
  //   @Body() AddRateRequest addRateRequest,
  // );
}
