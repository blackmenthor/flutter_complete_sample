import 'package:flutter_complete/core/cubit/states.dart';

extension BaseCubitStateExt on BaseCubitState {

  bool get isLoading => this is BaseCubitLoadingState;
  bool get hasError => this is BaseCubitErrorState;

}