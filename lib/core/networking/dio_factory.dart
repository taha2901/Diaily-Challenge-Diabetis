// import 'package:challenge_diabetes/core/helpers/constants.dart';
// import 'package:challenge_diabetes/core/helpers/shared_pref_helper.dart';
// import 'package:dio/dio.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// class DioFactory {
//   /// private constructor as I don't want to allow creating an instance of this class
//   DioFactory._();

//   static Dio? dio;

//   static Dio getDio() {
//     Duration timeOut = const Duration(seconds: 30);

//     if (dio == null) {
//       dio = Dio();
//       dio!
//         ..options.connectTimeout = timeOut
//         ..options.receiveTimeout = timeOut;
//       addDioHeaders();
//       addDioInterceptor();
//       return dio!;
//     } else {
//       return dio!;
//     }
//   }

//   static void addDioHeaders() async {
//     dio?.options.headers = {
//       'Accept': 'application/json',
//       'Authorization':
//           'Bearer ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken)}',
//     };
//   }

//   static void setTokenIntoHeaderAfterLogin(String? token) {
//     if (token == null || token.isEmpty) {
//       dio?.options.headers.remove('Authorization');
//     } else {
//       dio?.options.headers['Authorization'] = 'Bearer $token';
//     }
//   }

//   static void resetDio() {
//     dio = null; // هيتم إنشاؤه من جديد بعد أول طلب
//   }

//   static void addDioInterceptor() {
//     dio?.interceptors.add(
//       PrettyDioLogger(
//         requestBody: true,
//         requestHeader: true,
//         responseHeader: true,
//       ),
//     );
//   }
// }




import 'package:challenge_diabetes/core/helpers/constants.dart';
import 'package:challenge_diabetes/core/helpers/shared_pref_helper.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioHeaders();
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeaders() async {
    final token = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    
    dio?.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    // إضافة التوكن بس لو موجود
    if (token.isNotEmpty) {
      dio?.options.headers['Authorization'] = 'Bearer $token';
    }
  }

  static void setTokenIntoHeaderAfterLogin(String? token) {
    if (token == null || token.isEmpty) {
      // إزالة الـ Authorization header تماماً
      dio?.options.headers.remove('Authorization');
      print('🔓 Token removed from headers');
    } else {
      // إضافة أو تحديث الـ Authorization header
      dio?.options.headers['Authorization'] = 'Bearer $token';
      print('🔐 Token added to headers');
    }
  }

  static void resetDio() {
    // إزالة كل الـ interceptors والـ headers
    dio?.interceptors.clear();
    dio?.close();
    dio = null;
    print('🔄 Dio has been reset');
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        error: true,
        compact: true,
      ),
    );

    // إضافة interceptor للتعامل مع الـ 401 errors
    dio?.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException error, ErrorInterceptorHandler handler) {
          if (error.response?.statusCode == 401) {
            // التوكن منتهي الصلاحية أو غير صالح
            print('🚨 Unauthorized access - Token might be expired');
            // يمكن هنا نعمل automatic logout
            _handleUnauthorizedAccess();
          }
          handler.next(error);
        },
      ),
    );
  }

  static void _handleUnauthorizedAccess() async {
    // مسح التوكن المنتهي الصلاحية
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, '');
    setTokenIntoHeaderAfterLogin(null);
    
    // هنا يمكن إضافة navigation للـ login screen
    // أو إرسال event للـ app state management
    print('🔴 Clearing expired token');
  }
}