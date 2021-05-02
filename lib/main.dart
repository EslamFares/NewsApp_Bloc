import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_bloc/layout/home_layout.dart';
import 'package:news_app_bloc/shared/bloc_observer.dart';
import 'package:news_app_bloc/shared/cubit/home_cubit.dart';
import 'package:news_app_bloc/shared/cubit/home_state.dart';
import 'package:news_app_bloc/shared/network/local/cache_helper.dart';
import 'package:news_app_bloc/shared/network/remote/dio_helper.dart';

void main() async {
  //this line cause i use await in main...
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark = CacheHelper.getBoolean(key: 'isDark');
  runApp(MyApp(isDark));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  bool isDark;
  MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => HomeCubit()
            ..getBusiness()
            ..changeTheme(fromshared: isDark),
        )
      ],
      child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              title: 'News App',
              debugShowCheckedModeBanner: false,
              theme: ligthTheme(),
              darkTheme: dartThem(),
              themeMode: HomeCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: HomeLayout(),
            );
          }),
    );
  }

  ThemeData dartThem() {
    return ThemeData(
      scaffoldBackgroundColor: Color(0xff192734),
      primaryColor: Color(0xff192734),
      textTheme: TextTheme(
        // ignore: deprecated_member_use
        body1: TextStyle(
          color: Colors.white,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xff22303c),
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey),
      appBarTheme: AppBarTheme(
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        color: Color(0xff192734),
        centerTitle: false,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xff192734),
            statusBarIconBrightness: Brightness.light),
      ),
    );
  }

  ThemeData ligthTheme() {
    return ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          centerTitle: false,
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black, size: 25),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey[700],
          selectedLabelStyle: TextStyle(color: Colors.deepOrange),
          unselectedLabelStyle: TextStyle(color: Colors.grey),
        ),
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.white);
  }
}
