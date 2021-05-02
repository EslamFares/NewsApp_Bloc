import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_bloc/modules/business_screen/business_screen.dart';
import 'package:news_app_bloc/modules/science_screen/science_screen.dart';
import 'package:news_app_bloc/modules/sports_screen/sports_screen.dart';
import 'package:news_app_bloc/shared/network/local/cache_helper.dart';
import 'package:news_app_bloc/shared/network/remote/dio_helper.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);

//============
  List<Widget> bodyScreens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  //=======================
  int currentIndex = 0;
  void changeIndexBottomNav(int value) {
    currentIndex = value;
    if (currentIndex == 1) {
      getSports();
    }
    if (currentIndex == 2) {
      getScience();
    }
    emit(HomeChangeBottomNavState());
  }

  //==============
  String myApiKey = '2b7b5278db66427f998cccaa061b4bb9';
  String apiKey2 = '65f7f556ec76449fa7dc7c0069f040ca';
  //==========
  List business = [];
  void getBusiness() {
    if (business.length == 0) {
      emit(NewsGetBusinessLoadingState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {'country': 'eg', 'category': 'business', 'apiKey': apiKey2},
      ).then((value) {
        business = value.data['articles'];
        print('get business done..');
        emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetBusinessErrorState(error.toString()));
      });
    } else {
      emit(NewsGetBusinessSuccessState());
    }
  }

  //==============
  List sports = [];
  void getSports() {
    if (sports.length == 0) {
      emit(NewsGetSportsLoadingState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {'country': 'eg', 'category': 'sports', 'apiKey': apiKey2},
      ).then((value) {
        sports = value.data['articles'];
        print('get Sports done..');
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  //==============
  List science = [];
  void getScience() {
    if (science.length == 0) {
      emit(NewsGetScienceLoadingState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {'country': 'eg', 'category': 'science', 'apiKey': apiKey2},
      ).then((value) {
        science = value.data['articles'];
        print('get Science done..');
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  //===================
  bool isDark = true;
  void changeTheme({bool fromshared}) {
    if (fromshared != null) {
      isDark = fromshared;
      emit(ChangeThemeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then(
        (value) => emit(ChangeThemeState()),
      );
    }
  }

  //============================
  //https://newsapi.org/v2/everything?q=tesla&apiKey=2b7b5278db66427f998cccaa061b4bb9
  // search api
  //
  List search = [];
  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey': apiKey2,
      },
    ).then((value) {
      search = value.data['articles'];
      print('get search done..');
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }
}
