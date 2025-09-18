bool isLoggedInUser = false;
String? currentPassword;

class SharedPrefKeys {
  static const String userToken = 'userToken';
  static const String userName = 'userName';

  static const String onboard = 'onboard';
}

class DateHelper {
  static String getArabicDayName(int weekday) {
    const days = [
      'الأحد',
      'الاثنين',
      'الثلاثاء',
      'الأربعاء',
      'الخميس',
      'الجمعة',
      'السبت',
    ];
    return days[weekday % 7];
  }

  static String getArabicMonth(int month) {
    const months = [
      'يناير',
      'فبراير',
      'مارس',
      'أبريل',
      'مايو',
      'يونيو',
      'يوليو',
      'أغسطس',
      'سبتمبر',
      'أكتوبر',
      'نوفمبر',
      'ديسمبر',
    ];
    return months[month - 1];
  }

  static String getCurrentDate() {
    DateTime currentDate = DateTime.now();
    return "${currentDate.year}-${currentDate.month}-${currentDate.day}";
  }

  static String formatDate(DateTime date) {
    return date.toString().split(' ')[0];
  }

  static String formatDateTime(DateTime dateTime) {
    return "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} "
        "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  }
}
