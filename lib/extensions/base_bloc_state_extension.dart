import 'package:flutter_complete/base/cubit/states.dart';

extension BaseCubitStateExt on BaseCubitState {

  bool get isLoading => this is BaseCubitLoadingState;
  bool get hasError => this is BaseCubitErrorState;

}