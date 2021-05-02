import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_bloc/shared/cubit/home_cubit.dart';
import 'package:news_app_bloc/shared/cubit/home_state.dart';
import 'package:news_app_bloc/shared/widgets/newslistview.dart';

class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = HomeCubit.get(context).sports;
        return  list.length >0
            ? newsListView(list)
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
