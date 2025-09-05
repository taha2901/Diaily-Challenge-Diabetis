class ApiConstants {
  static const String apiBaseUrl = 'http://diabetesapp.runasp.net/api/';

  static const String login = 'Auth/Login';

  static const String register = 'Auth/register';

  static const String doctor = 'Doctors/SelectDoctors';

  static const String popularDoctor = 'Doctors/PopularDoctors';

  static const String availableTime = 'Doctors/AvailableTime';

  static const String reservation = 'Doctors/Reservation';

  static const String cancelReservation = 'profiles/DeleteResrvation';

  static const String medicines = 'Medicine/Get medicines for user';

  static const String deleteMedicine = 'Medicine/Deletemedicine';

  static const String addMedicine = 'Medicine/AddMedicines';

  static const String bloodSugar = 'Measurements/blood sugar level';

  static const String bloodPressure = 'Measurements/blood pressure';

  static const String weight = 'Measurements/weight';

  static const String getBloodSuger = 'Selecting_data/user\'s sugar_data';

  static const String getWeight = 'Selecting_data/user\'s weight_data';

  static const String getPressure = 'Selecting_data/user\'s presure_data';

  static const String settings = 'Auth/Get User Details';

  static const String updateProfile = 'Auth/UpdateUser';

  static const String getExercise = 'Sports/DisplaySports';

  static const String getFavourite = 'Favorites/GetFavoritesDoctors';
  static const String addFavourite = 'Favorites/AddandRemoveFavoriteDoctor';

  static const String medicalRecord = 'profiles/UserReservations';

  static const String deleteMedicalRecord = 'profiles/DeletedUserReservations';

  static const String addPerson = 'AddObserver/AddObserver';

  static const String getDoctorComments = 'DoctotComment/Get comments';

  static const String addDoctorComment = 'DoctotComment/AddDoctorcomment';

  static const String addRate = 'Doctors/RateDoctor';
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
