import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String urlimage;
  CustomAppBar({
    @required this.urlimage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0,
      padding: EdgeInsets.symmetric(horizontal: 17),
      child: Align(
        alignment: Alignment.topRight,
        child: CircleAvatar(
          radius: 27,
          backgroundColor: Colors.black12,
          backgroundImage: NetworkImage(urlimage),
        ),
      ),
    );
  }
}
