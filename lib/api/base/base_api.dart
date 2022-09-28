import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_complete/api/base/base_exception.dart';
import 'package:flutter_complete/api/base/response_object.dart';
import 'package:flutter_complete/extensions/response_extensions.dart';
import 'package:flutter_complete/utils/constants.dart';

class BaseApi<T extends ResponseObject> {

  BaseApi({
    required this.baseEndpoint,
    required this.serializer,
    Duration timeout = const Duration(seconds: 5),
  }) {
    final dioOptions = BaseOptions(
        baseUrl: baseEndpoint,
        receiveTimeout: timeout.inMilliseconds,
        sendTimeout: timeout.inMilliseconds,
    );
    dio = Dio(dioOptions);
    connectivity = Connectivity();
  }

  final String baseEndpoint;
  final T Function(Map<String, dynamic>) serializer;

  // move to DI.
  late final Dio dio;
  late final Connectivity connectivity;

  Future<R> _call<R>({
    required Future<R> Function() body,
  }) async {
    // check if internet is active or not
    final connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      throw NoInternetException();
    }

    try {
      return body();
    } on DioError catch (ex) {
      // change to extension function

      throw ApiException(
        statusCode: ex.response?.statusCode ?? 400,
        responseBody: ex.response?.data?.toString(),
        error: ex,
      );
    } on NoInternetException catch (_) {
      rethrow;
    } catch (ex) {
      throw ApiException(error: ex);
    }
  }

  Future<T> get({
    required String path,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    final requestHeaders = defaultHeaders;
    if (headers?.isNotEmpty ?? false) {
      requestHeaders.addAll(headers!);
    }

    return _call<T>(
      body: () async {
        final response = await dio.get<String>(
          resolvePath(path: path),
          queryParameters: queryParams,
          options: Options(
            headers: requestHeaders,
          ),
        );
        response.checkIfCallIsSuccessful();

        final jsonString = response.data?.toString();
        final json = jsonDecode(jsonString!) as Map<String, dynamic>;

        return serializer(json);
      },
    );
  }

  Future<List<T>> getList({
    required String path,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    final requestHeaders = defaultHeaders;
    if (headers?.isNotEmpty ?? false) {
      requestHeaders.addAll(headers!);
    }

    return _call<List<T>>(
      body: () async {
        final response = await dio.get<String>(
          resolvePath(path: path),
          queryParameters: queryParams,
          options: Options(
            headers: requestHeaders,
          ),
        );
        response.checkIfCallIsSuccessful();

        final jsonString = response.data?.toString();

        final ret = <T>[];
        final json = jsonDecode(jsonString!) as List<dynamic>;

        for (final item in json) {
          final serializedItem = serializer(item as Map<String, Object?>);
          ret.add(serializedItem);
        }

        return ret;
      },
    );
  }

  Future<T> post({
    required String path,
    required Map<String, dynamic> body,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) {
    final requestHeaders = defaultHeaders;
    if (headers?.isNotEmpty ?? false) {
      requestHeaders.addAll(headers!);
    }

    return _call<T>(
      body: () async {
        final response = await dio.post<String>(
          resolvePath(path: path),
          queryParameters: queryParams,
          data: body,
          options: Options(
            headers: requestHeaders,
          ),
        );
        response.checkIfCallIsSuccessful();

        final jsonString = response.data?.toString();
        final json = jsonDecode(jsonString!) as Map<String, dynamic>;

        return serializer(json);
      },
    );
  }

  Future<T> put({
    required String path,
    required Map<String, dynamic> body,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) {
    final requestHeaders = defaultHeaders;
    if (headers?.isNotEmpty ?? false) {
      requestHeaders.addAll(headers!);
    }

    return _call<T>(
      body: () async {
        final response = await dio.put<String>(
          resolvePath(path: path),
          queryParameters: queryParams,
          data: body,
          options: Options(
            headers: requestHeaders,
          ),
        );
        response.checkIfCallIsSuccessful();

        final jsonString = response.data?.toString();
        final json = jsonDecode(jsonString!) as Map<String, dynamic>;

        return serializer(json);
      },
    );
  }

  Future<T> delete({
    required String path,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) {
    final requestHeaders = defaultHeaders;
    if (headers?.isNotEmpty ?? false) {
      requestHeaders.addAll(headers!);
    }

    return _call<T>(
      body: () async {
        final response = await dio.delete<String>(
          resolvePath(path: path),
          queryParameters: queryParams,
          options: Options(
            headers: requestHeaders,
          ),
        );
        response.checkIfCallIsSuccessful();

        final jsonString = response.data?.toString();
        final json = jsonDecode(jsonString!) as Map<String, dynamic>;

        return serializer(json);
      },
    );
  }

  String resolvePath({
    required String path,
  }) => baseEndpoint + path;

  Map<String, dynamic> get defaultHeaders {
    final headers = <String, dynamic>{
      Constants.contentTypeHeaderKey: Constants.contentTypeHeaderValue,
    };

    // fill in auth headers here if needed

    return headers;
  }

}