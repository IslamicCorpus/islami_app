import 'package:flutter/material.dart';
import 'package:islami/const/customColor.dart';
import 'package:islami/modules/articles/screens/add_article_view.dart';
import 'package:islami/modules/articles/services/article_service.dart';
import 'package:islami/modules/articles/widgets/appbar_article.dart';
import 'package:islami/modules/articles/widgets/article_card.dart';
import 'package:provider/provider.dart';

class ArticleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final articleProv = Provider.of<ArticleService>(context);
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              AppbarArticle(),
              SizedBox(height: 20),
              FutureBuilder(
                  future: articleProv.getDataCollection(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: CircularProgressIndicator());
                    }

                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ArticleCard(article: snapshot.data[index]);
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddArticleView(),
              ));
        },
        backgroundColor: Color(primaryColor),
        child: Icon(Icons.add),
      ),
    );
  }
}
