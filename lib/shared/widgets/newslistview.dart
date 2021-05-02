  import 'package:flutter/material.dart';
import 'package:news_app_bloc/shared/widgets/newsItem.dart';

Widget newsListView(List list) {
    return ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return newsItem(context,list[index]);
              },
              itemCount: list.length,
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  height: 1.5,
                  color: Colors.grey,
                );
              },
            );
  }