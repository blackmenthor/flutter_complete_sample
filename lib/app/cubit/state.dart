import 'package:flutter/material.dart';

class AppState {
  AppState({
      this.themeMode = ThemeMode.light,
  });

  bool get isLightTheme => themeMode == ThemeMode.light;

  final ThemeMode themeMode;

  AppState copyWith({
    ThemeMode? themeMode,
  }) {
    return AppState(
      themeMode: themeMode ?? this.themeMode,
    );
  }

}