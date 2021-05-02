import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_bloc/shared/cubit/home_cubit.dart';
import 'package:news_app_bloc/shared/cubit/home_state.dart';
import 'package:news_app_bloc/shared/widgets/back_button.dart';
import 'package:news_app_bloc/shared/widgets/defaultFormedField.dart';
import 'package:news_app_bloc/shared/widgets/newslistview.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var searchList = HomeCubit.get(context).search;
          return Scaffold(
            body: SafeArea(
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomBackButton(),
                    defaultFormedField(
                      controller: searchController,
                      onChange: (value) {
                        HomeCubit.get(context).getSearch(value);
                      },
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'please, write..';
                        }
                        return null;
                      },
                      hintText: 'Search..',
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.blue,
                      ),
                    ),
                    Expanded(
                        child: searchList.length > 0
                            ? newsListView(searchList)
                            : Center(
                                child: searchController.text.isEmpty
                                    ? Text('write to search..')
                                    : CircularProgressIndicator(),
                              ))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
