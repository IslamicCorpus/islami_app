import 'package:flutter/material.dart';
import 'package:islami/modules/articles/models/article_model.dart';

class ImageAndAppbar extends StatelessWidget {
  final ArticleModel article;
  ImageAndAppbar({this.article});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Hero(
          tag: article.id,
          child: Image.network(
            article.urlimage,
            width: double.infinity,
            height: 350,
            fit: BoxFit.cover,
          ),
        ),
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        )
      ],
    );
  }
}
