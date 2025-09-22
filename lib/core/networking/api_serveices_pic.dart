import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiServeicesPic {
  final Dio dio = Dio();
  Future<Response> POST({
    required String url,
    required body,
    required String token,
    String? contentType,
  }) async {
    var response = await dio.post(
      url,
      data: body,
      options: Options(
        headers: {
          'lang': 'en',
          'Authorization': 'Bearer $token',
          'Content-Type': contentType ?? 'application/json',
        },
      ),
    );
    return response;
  }



   Future<Response> uploadImage({
    required String url,
    required File image,
    String lang = 'ar',
    String? token,
  }) async {
    dio?.options.headers = {
      'Content-Type': 'multipart/form-data',
      'lang': lang,
      'Authorization': token ?? '',
    };

    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(image.path,
          filename: image.path.split('/').last),
    });

    try {
      var response = await dio!.post(
        url,
        data: formData,
      );
      debugPrint('Response: ${response.data}');
      return response;
    } on DioError catch (e) {
      debugPrint('Error: ${e.response?.statusCode} - ${e.message}');
      if (e.response != null) {
        debugPrint('Response data: ${e.response?.data}');
      }
      throw e;
    }
  }
}
