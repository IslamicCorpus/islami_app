import 'package:flutter/material.dart';
import 'package:islami/modules/home/widgets/image_card.dart';
import 'package:islami/modules/quotes/screens/quotes_detail_view.dart';
import 'package:islami/modules/quotes/services/quotes_service.dart';
import 'package:provider/provider.dart';

class QuotesImage extends StatelessWidget {
  final String title;
  QuotesImage({@required this.title});
  @override
  Widget build(BuildContext context) {
    final quotesProv = Provider.of<QuotesService>(context);
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
        SizedBox(height: 12),
        Container(
          width: double.infinity,
          height: 200,
          padding: EdgeInsets.only(left: 17.0),
          child: FutureBuilder(
              future: quotesProv.getDataCollection(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: CircularProgressIndicator());
                }

                return ListView.builder(
                  itemCount: snapshot.data.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
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
                      child: ImageCardWiget(
                        quotes: quotes,
                      ),
                    );
                  },
                );
              }),
        )
      ],
    );
  }
}
