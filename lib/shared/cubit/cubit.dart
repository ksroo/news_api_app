import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/businessScree.dart';
import 'package:news_app/screens/scienceScreen.dart';
import 'package:news_app/screens/settingsScreen.dart';
import 'package:news_app/screens/sportsScreen.dart';

import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitialStste());

  static CounterCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      label: "Business",
      backgroundColor: Colors.white,
      icon: Icon(
        Icons.business,
      ),
    ),
    BottomNavigationBarItem(
      label: "Sports",
      backgroundColor: Colors.white,
      icon: Icon(
        Icons.sports,
      ),
    ),
    BottomNavigationBarItem(
      label: "Science",
      backgroundColor: Colors.white,
      icon: Icon(
        Icons.science,
      ),
    ),
    BottomNavigationBarItem(
      label: "Settings",
      backgroundColor: Colors.white,
      icon: Icon(
        Icons.settings,
      ),
    ),
  ];

  List<Widget> bottomScreens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    if (index == 1) {
      getSports();
    }
    if (index == 2) {
      getScience();
    }
    emit(BottomChangeIndex());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewGetBusinessLoadigState());
    DioHelper.getData(
      url: "v2/top-headlines",
      query: {
        'country': "eg",
        'category': 'business',
        'apiKey': 'ffc8c0eefece41b28b04ab971aa79cc7',
      },
    ).then((value) {
      business = value.data["articles"];

      print(business[0]['title']);
      emit(NewGetBusinessStateSuccesc());
    }).catchError((error) {
      print(error.toString());
      emit(NewGetBusinessStateError(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewGetSportsLoadigState());
    DioHelper.getData(
      url: "v2/top-headlines",
      query: {
        'country': "eg",
        'category': 'sports',
        'apiKey': 'ffc8c0eefece41b28b04ab971aa79cc7',
      },
    ).then((value) {
      sports = value.data["articles"];

      print(sports[0]['title']);
      emit(NewGetSportsStateSuccesc());
    }).catchError((error) {
      print(error.toString());
      emit(NewGetSportsStateError(error.toString()));
    });
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewGetSicenceLoadigState());
    DioHelper.getData(
      url: "v2/top-headlines",
      query: {
        'country': "eg",
        'category': 'science',
        'apiKey': 'ffc8c0eefece41b28b04ab971aa79cc7',
      },
    ).then((value) {
      science = value.data["articles"];

      print(science[0]['title']);
      emit(NewGetSicenceStateSuccesc());
    }).catchError((error) {
      print(error.toString());
      emit(NewGetSicenceStateError(error.toString()));
    });
  }

  
}
