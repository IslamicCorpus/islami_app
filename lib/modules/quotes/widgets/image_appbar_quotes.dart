import 'package:flutter/material.dart';
import 'package:islami/modules/quotes/models/quotes_model.dart';

class ImageAndAppbarQuotes extends StatelessWidget {
  final QuotesModel quotes;
  ImageAndAppbarQuotes({this.quotes});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Hero(
          tag: quotes.id,
          child: Image.network(
            quotes.urlimage,
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
