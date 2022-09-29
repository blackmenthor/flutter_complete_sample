import 'package:flutter_complete/core/exceptions/app_exception.dart';

class ApiException extends AppException {

  ApiException({
      this.statusCode,
      this.responseBody,
      required this.error,
  });

  final int? statusCode;
  final String? responseBody;
  final dynamic error;

  @override
  dynamic get originalError => error;

  @override
  String get userFriendlyMessage {
    switch (statusCode) {
      case 404:
        return 'Cannot found the resources you requested';
      case 400:
        return 'There are some problems with your request';
      default:
        return 'There are problems fetching your request';
    }
  }

}

class ApiCallException {}

class NoInternetException extends ApiException {

  NoInternetException() : super(
    statusCode: -1,
    responseBody: null,
    error: Exception("You're not connected to internet"),
  );

  @override
  dynamic get originalError => error;

  @override
  String get userFriendlyMessage => "You're not connected to internet";

}