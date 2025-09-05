bool isLoggedInUser = false;
String? currentPassword;

class SharedPrefKeys {
  static const String userToken = 'userToken';
  static const String userName = 'userName';

  static const String onboard = 'onboard';
}

class DateHelper {
  static String getCurrentDate() {
    DateTime currentDate = DateTime.now();
    return "${currentDate.year}-${currentDate.month}-${currentDate.day}";
  }

  static String formatDate(DateTime date) {
    return date.toString().split(' ')[0];
  }
}