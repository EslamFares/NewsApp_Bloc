import 'package:flutter/material.dart';
import 'package:news_app_bloc/modules/web_view/web_view_screen.dart';
import 'package:news_app_bloc/shared/widgets/loadingImag.dart';

Widget newsItem(context, newsItem) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => WebViewScreen(newsItem['url']),
        ),
      );
    },
    child: Container(
        height: 120,
        padding: EdgeInsets.all(5),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: loadImage(newsItem)),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newsItem['title'],
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  dateTime(newsItem),
                ],
              ),
            )
          ],
        )),
  );
}

Row dateTime(newsItem) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text(
        newsItem['publishedAt'].toString().split('T')[0].toString(),
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.grey,
        ),
      ),
      Text(
        newsItem['publishedAt']
            .toString()
            .split('T')[1]
            .toString()
            .substring(0, 5)
            .toString(),
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.grey,
        ),
      ),
    ],
  );
}
