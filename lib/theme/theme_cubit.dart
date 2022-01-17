import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template brightness_cubit}
/// A simple [Cubit] that manages the [ThemeData] as its state.
/// {@endtemplate}
class ThemeCubit extends Cubit<ThemeData> {
  /// {@macro brightness_cubit}
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData(
    primarySwatch: Colors.orange,
    primaryColor: Colors.deepPurple,
//    scaffoldBackgroundColor: Colors.cyan.shade600,
    appBarTheme: AppBarTheme(
      color: Colors.lightBlue,
      iconTheme: IconThemeData(color: Colors.grey[800]),
      elevation: 1.5,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        borderSide: BorderSide.none,
      ),
      contentPadding: EdgeInsets.all(8),
      filled: true,
      fillColor: Color(0x0A000000),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      backgroundColor: Colors.orange,
    ),
    brightness: Brightness.light,
  );

  static final _darkTheme = ThemeData(
    primarySwatch: Colors.orange,
    primaryColor: Colors.deepPurple,
    //scaffoldBackgroundColor: Colors.cyan.shade600,
    appBarTheme: AppBarTheme(
      color: Colors.lightBlue,
      iconTheme: IconThemeData(color: Colors.grey[800]),
      elevation: 1.5,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        borderSide: BorderSide.none,
      ),
      contentPadding: EdgeInsets.all(8),
      filled: true,
      fillColor: Color(0x0A000000),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
      backgroundColor: Colors.orange,
    ),
    brightness: Brightness.dark,
  );

  /// Toggles the current brightness between light and dark.
  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}
