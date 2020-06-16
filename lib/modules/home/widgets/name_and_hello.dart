import 'package:flutter/material.dart';
import 'package:islami/const/lang.dart';

class NameAndHello extends StatelessWidget {
  final String name;

  NameAndHello({
    @required this.name,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "$xHi $name",
            style: TextStyle(
              fontSize: 17,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 7.0),
          Text(
            xApakabar,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
