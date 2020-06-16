import 'package:flutter/material.dart';

class ArticleTitle extends StatelessWidget {
  final String title;
  ArticleTitle({this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
