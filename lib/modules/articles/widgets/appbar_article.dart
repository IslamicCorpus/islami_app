import 'package:flutter/material.dart';
import 'package:islami/const/lang.dart';

class AppbarArticle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),
              ),
              image: DecorationImage(
                image: AssetImage(xUrlSurga),
                fit: BoxFit.cover,
              )),
        ),
        Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),
              ),
              gradient: LinearGradient(
                colors: [Colors.black54, Colors.black26, Colors.black54],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        Positioned(
            top: 50,
            left: 17,
            right: 17,
            child: Container(
              width: 100,
              child: Center(
                child: Text(
                  "Artikel",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
