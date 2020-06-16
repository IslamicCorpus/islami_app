import 'package:flutter/material.dart';
import 'package:islami/modules/quotes/models/quotes_model.dart';

class ImageCardWiget extends StatelessWidget {
  final QuotesModel quotes;
  ImageCardWiget({this.quotes});
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: quotes.id,
      child: Container(
          width: 235.0,
          height: 200,
          margin: EdgeInsets.only(right: 15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            image: DecorationImage(
              image: NetworkImage(quotes.urlimage),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            width: 235.0,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: LinearGradient(
                colors: [Colors.black54, Colors.white10, Colors.black38],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          )),
    );
  }
}
