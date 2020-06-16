import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:islami/const/customColor.dart';
import 'package:islami/modules/quotes/screens/add_photo_view.dart';
import 'package:islami/modules/quotes/screens/quotes_detail_view.dart';
import 'package:islami/modules/quotes/services/quotes_service.dart';
import 'package:provider/provider.dart';

class QuotesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final quotesProv = Provider.of<QuotesService>(context);
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: FutureBuilder(
            future: quotesProv.getDataCollection(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: CircularProgressIndicator());
              }

              return StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  var quotes = snapshot.data[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                QuotesDetailView(quotes: quotes),
                          ));
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Hero(
                        tag: quotes.id,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              image: DecorationImage(
                                image: NetworkImage(quotes.urlimage),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                    ),
                  );
                },
                staggeredTileBuilder: (int index) =>
                    new StaggeredTile.count(2, index.isEven ? 3 : 2),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              );
            }),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _settingModalBottomSheet(context);
      //   },
      //   backgroundColor: Color(primaryColor),
      //   child: Icon(Icons.add),
      // ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.image),
                    title: new Text('Upload gambar'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddPhotoView()));
                    }),
              ],
            ),
          );
        });
  }
}
