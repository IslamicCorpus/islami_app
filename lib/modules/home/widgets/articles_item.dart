import 'package:flutter/material.dart';
import 'package:islami/modules/articles/services/article_service.dart';
import 'package:islami/modules/articles/widgets/article_card.dart';
import 'package:provider/provider.dart';

class ArticlesItems extends StatelessWidget {
  final String title;
  ArticlesItems({@required this.title});
  @override
  Widget build(BuildContext context) {
    final articleProv = Provider.of<ArticleService>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: Text(title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
        ),
        // SizedBox(height: 12),
        Container(
          // margin: EdgeInsets.symmetric(horizontal: 17.0),
          child: FutureBuilder(
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
                    var article = snapshot.data[index];
                    return ArticleCard(article: article);
                    // return Container(
                    //   width: double.infinity,
                    //   height: 250,
                    //   margin: EdgeInsets.only(bottom: 15.0),
                    //   child: Card(
                    //     elevation: 3,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(14.0),
                    //     ),
                    //     child: Column(
                    //       children: <Widget>[
                    //         Container(
                    //           width: double.infinity,
                    //           height: 150.0,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.only(
                    //                 topLeft: Radius.circular(14.0),
                    //                 topRight: Radius.circular(14.0),
                    //               ),
                    //               image: DecorationImage(
                    //                 image: NetworkImage(article.urlimage),
                    //                 fit: BoxFit.cover,
                    //               )),
                    //         ),
                    //         Padding(
                    //           padding: EdgeInsets.all(14.0),
                    //           child: Text(
                    //             xPost,
                    //             maxLines: 2,
                    //             overflow: TextOverflow.ellipsis,
                    //             style: TextStyle(
                    //               fontSize: 20,
                    //               height: 1.5,
                    //               fontWeight: FontWeight.w500,
                    //             ),
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // );
                  },
                );
              }),
        )
      ],
    );
  }
}
