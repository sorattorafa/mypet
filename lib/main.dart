import 'package:flutter/material.dart';
import 'package:petshop/app.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petshop/bloc/app_bloc_observer.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: AppBlocObserver(),
  );
}
