



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/states.dart';


class AppCubit extends Cubit<AppCubit> {
  AppCubit() : super(CounterInitialStste());

  static AppCubit get(context) => BlocProvider.of(context);

  

  bool isDark = false;
  ThemeMode appmode = ThemeMode.dark;

  void changeAppMode() {
    if (isDark == false) {
      appmode = ThemeMode.light;
    } else {
      appmode = ThemeMode.dark;
    }
    emit(AppChangeModeState());
  }






}
