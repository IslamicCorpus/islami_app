import 'package:flutter/material.dart';
import 'package:islami/modules/articles/models/article_model.dart';
import 'package:islami/modules/articles/widgets/article_paper.dart';
import 'package:islami/modules/articles/widgets/article_title.dart';
import 'package:islami/modules/articles/widgets/customListTile.dart';
import 'package:islami/modules/articles/widgets/imageAndAppbar.dart';

class ReadArticleView extends StatelessWidget {
  final ArticleModel article;
  ReadArticleView({this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ImageAndAppbar(article: article),
              SizedBox(height: 15),
              ArticleTitle(title: article.title),
              ArtikelListTile(
                name: article.sender,
                urlimage: article.urlimagesender,
              ),
              ArticlePaper(description: article.description)
            ],
          ),
        ),
      ),
    );
  }
}
