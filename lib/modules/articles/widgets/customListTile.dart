import 'package:flutter/material.dart';

class ArtikelListTile extends StatelessWidget {
  final String urlimage;
  final String name;
  ArtikelListTile({
    @required this.urlimage,
    @required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.black12,
        backgroundImage: NetworkImage(urlimage),
      ),
      title: Text(
        name,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
