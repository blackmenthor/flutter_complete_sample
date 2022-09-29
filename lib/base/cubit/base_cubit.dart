import 'package:bloc/bloc.dart';
import 'package:flutter_complete/base/cubit/states.dart';
import 'package:flutter_complete/exceptions/app_exception.dart';
import 'package:flutter_complete/utils/logger/logger.dart';

abstract class BaseCubit<T> extends Cubit<BaseCubitState> {

  BaseCubit() : super(BaseCubitLoadingState()) {
    kickOff();
  }

  void gotError(dynamic error) {
    logger.e(error: error);
  }

  Future<void> kickOff() async {
    emit(BaseCubitLoadingState());
    try {
      final value = await loadData();
      emit(BaseCubitLoadedState<T>(
        data: value,
      ));
    } on AppException catch (ex) {
      gotError(ex);
      emit(BaseCubitErrorState(error: ex));
    } catch (ex) {
      gotError(ex);
      emit(
          BaseCubitErrorState(error: DefaultAppException(),),
      );
    }
  }

  Future<T> loadData();

}