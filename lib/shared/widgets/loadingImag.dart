
import 'package:flutter/material.dart';

Image loadImage(newsItem) {
  try {
    return Image.network(
      
      newsItem['urlToImage'] != null
          ? newsItem['urlToImage']
          : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSthI-eJY2ZqkOSBl6uv1psGyhDiLpwSvjxA&usqp=CAU',
      fit: BoxFit.cover,
      errorBuilder:
          (BuildContext context, Object exception, StackTrace stackTrace) {
        return Image(
          image: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSthI-eJY2ZqkOSBl6uv1psGyhDiLpwSvjxA&usqp=CAU'),
          fit: BoxFit.cover,
        );
      },
      
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes
                : null,
          ),
        );
      },
      
    );
  } catch (error) {
    return Image(
      image: NetworkImage(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSthI-eJY2ZqkOSBl6uv1psGyhDiLpwSvjxA&usqp=CAU'),
      fit: BoxFit.cover,
    );
  }
}
