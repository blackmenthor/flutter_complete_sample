import 'package:flutter_complete/exceptions/app_exception.dart';

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

  // TODO: return user friendly message from the API
  @override
  String get userFriendlyMessage => throw UnimplementedError();

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