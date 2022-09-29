import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete/app/cubit/state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState());

  bool get isLight => state.themeMode == ThemeMode.light;

  void toggleTheme() {
    emit(
      state.copyWith(
        themeMode: isLight ? ThemeMode.dark : ThemeMode.light,
      ),
    );
  }

}