import 'package:flutter/material.dart';
import 'package:islami/const/customColor.dart';

class CustomListTileProfile extends StatelessWidget {
  final IconData leading;
  final String title;
  final String subtitle;
  final Function onTap;
  CustomListTileProfile({
    @required this.leading,
    @required this.title,
    @required this.subtitle,
    @required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0),
      child: ListTile(
        leading: Icon(
          leading,
          size: 30,
        ),
        title: Text(
          title == null ? "Data belum diisi" : title,
          style: TextStyle(fontSize: 18, color: Color(primaryColor)),
        ),
        subtitle: Text(subtitle),
        trailing: IconButton(
          icon: Icon(Icons.edit),
          color: Colors.black38,
          iconSize: 20,
          onPressed: onTap,
        ),
      ),
    );
  }
}
