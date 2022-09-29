import 'package:dio/dio.dart';
import 'package:flutter_complete/core/api/base/base_exception.dart';

extension ResponseExtension on Response {

  int get code => statusCode ?? 0;

  bool get isSuccessful => code >= 200 && code < 400;

  void checkIfCallIsSuccessful() {
    if (!isSuccessful) {
      throw ApiException(
          responseBody: data?.toString(),
          statusCode: code,
          error: Exception(code),
      );
    }
  }

}