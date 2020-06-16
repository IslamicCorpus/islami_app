import 'package:flutter/material.dart';

class ArticlePaper extends StatelessWidget {
  final String description;
  ArticlePaper({this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 9, vertical: 12),
        child: Text(
          description,
          style: TextStyle(
            fontSize: 18,
            height: 1.5,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
