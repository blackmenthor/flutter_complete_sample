import 'package:flutter_complete/exceptions/app_exception.dart';

abstract class BaseCubitState {}

class BaseCubitLoadingState extends BaseCubitState {}

class BaseCubitErrorState extends BaseCubitState {
  BaseCubitErrorState({
      required this.error,
  });

  final AppException error;

}

class BaseCubitLoadedState<T> extends BaseCubitState {
  BaseCubitLoadedState({
      required this.data,
  });

  final T data;

}
