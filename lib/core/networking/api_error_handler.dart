import 'package:dio/dio.dart';
import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(title: 'Connection Server Error');
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(title: 'Connection Timeout Error');
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(title: 'Send Timeout Error');
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(title: 'Receive Timeout Error');
        case DioExceptionType.badResponse:
          return _handleDioError(error.response?.data);
        case DioExceptionType.cancel:
          return ApiErrorModel(title: 'Request Cancelled');
        case DioExceptionType.badCertificate:
          return ApiErrorModel(title: 'Bad Certificate Error');
        case DioExceptionType.unknown:
          return ApiErrorModel(title: 'Unknown Error');
      }
    }
    return ApiErrorModel(title: 'Unexpected Error');
  }

  static ApiErrorModel _handleDioError(dynamic data) {
    if (data is Map<String, dynamic>) {
      // التحقق إذا كانت الاستجابة تحتوي على `message` فقط
      if (data.containsKey('message')) {
        return ApiErrorModel(
          title: data['message'], // استخدام `message` كعنوان للخطأ
          status: null, // لا حاجة لتعيين حالة هنا
          errors: null, // لا توجد أخطاء إضافية
        );
      } else {
        // معالجة الاستجابات التقليدية التي تحتوي على `errors`
        return ApiErrorModel(
          title: data['title'] ?? 'Unexpected Error',
          status: data['status'] ?? 400, // استخدام 400 كقيمة افتراضية للحالة
          errors: _parseErrors(data['errors']),
        );
      }
    }
    // خطأ غير متوقع في حال لم تكن استجابة JSON
    return ApiErrorModel(title: 'Unexpected Error', status: 400);
  }

  static Map<String, List<String>>? _parseErrors(dynamic errors) {
    if (errors is Map<String, dynamic>) {
      return errors.map((key, value) {
        if (value is List) {
          return MapEntry(key, value.map((v) => v.toString()).toList());
        } else {
          return MapEntry(key, [value.toString()]);
        }
      });
    }
    return null;
  }
}
