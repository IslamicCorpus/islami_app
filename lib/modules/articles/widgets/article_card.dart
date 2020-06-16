import 'package:flutter/material.dart';
import 'package:islami/modules/articles/models/article_model.dart';
import 'package:islami/modules/articles/screens/edit_article_view.dart';
import 'package:islami/modules/articles/screens/read_article_view.dart';
import 'package:islami/modules/articles/services/article_service.dart';
import 'package:islami/modules/sign_in/services/login_service.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleCard extends StatelessWidget {
  final ArticleModel article;
  ArticleCard({this.article});

  @override
  Widget build(BuildContext context) {
    final articleProv = Provider.of<ArticleService>(context);
    final loginProv = Provider.of<LoginService>(context);
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReadArticleView(article: article),
            ));
      },
      child: Container(
        width: double.infinity,
        // height: 300,
        padding: EdgeInsets.symmetric(horizontal: 17.0),
        margin: EdgeInsets.only(bottom: 15.0),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: Column(
            children: <Widget>[
              Hero(
                tag: article.id,
                child: Container(
                  width: double.infinity,
                  height: 160.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(14.0),
                        topRight: Radius.circular(14.0),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(article.urlimage),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.0, vertical: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      article.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        // height: 1.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.black12,
                              backgroundImage:
                                  NetworkImage(article.urlimagesender),
                            ),
                            // SizedBox(width: 12),
                            Text(
                              article.sender,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black54,
                                // fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 120),
                            article.senderId == loginProv.profileModel.id
                                ? IconButton(
                                    icon: Icon(Icons.more_vert),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              content: Container(
                                                height: 50,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    EditArticleView(
                                                                        article:
                                                                            article)));
                                                      },
                                                      child: Text("Edit"),
                                                    ),
                                                    SizedBox(height: 10),
                                                    GestureDetector(
                                                      onTap: () {
                                                        articleProv
                                                            .removeDocument(
                                                                article.id)
                                                            .then((value) =>
                                                                Navigator.pop(
                                                                    context))
                                                            .then((value) =>
                                                                articleProv.showToast(
                                                                    "Artikel berhasil dihapus",
                                                                    context));
                                                      },
                                                      child: Text("Hapus"),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                  )
                                : Container(),
                          ],
                        ),
                        SizedBox(height: 12),
                        Text(
                          timeago.format(article.created),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black45,
                            // fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 12),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
