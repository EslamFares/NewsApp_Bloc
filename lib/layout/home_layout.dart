import 'package:flutter/material.dart';
import 'package:news_app_bloc/modules/search_screen/search_screen.dart';
import 'package:news_app_bloc/shared/cubit/home_cubit.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'News App',
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              }),
          IconButton(
              icon: Icon(
                Icons.brightness_4_outlined,
              ),
              onPressed: () {
                HomeCubit.get(context).changeTheme();
              }),
        ],
      ),
      body: cubit.bodyScreens[cubit.currentIndex],
      bottomNavigationBar: buildBottomNavigationBar(cubit),
    );
  }

  BottomNavigationBar buildBottomNavigationBar(HomeCubit cubit) {
    return BottomNavigationBar(
      currentIndex: cubit.currentIndex,
      onTap: (value) {
        cubit.changeIndexBottomNav(value);
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.business_sharp),
            // ignore: deprecated_member_use
            title: Text('Business')),
        BottomNavigationBarItem(
          icon: Icon(Icons.sports_basketball),
          // ignore: deprecated_member_use
          title: Text('Sport'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.science),
          // ignore: deprecated_member_use
          title: Text('Science'),
        ),
      ],
    );
  }
}
