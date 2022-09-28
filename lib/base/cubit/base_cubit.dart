import 'package:bloc/bloc.dart';
import 'package:flutter_complete/base/cubit/states.dart';
import 'package:flutter_complete/exceptions/app_exception.dart';

abstract class BaseCubit<T> extends Cubit<BaseCubitState> {

  BaseCubit() : super(BaseCubitLoadingState()) {
    kickOff();
  }

  void gotError(dynamic error) {
    print(error.toString());
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