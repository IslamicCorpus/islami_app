import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/const/lang.dart';
import 'package:islami/modules/articles/screens/article_view.dart';
import 'package:islami/modules/shalat/screens/sholat_view.dart';
import 'package:islami/modules/maps/screens/masjid_map_view.dart';

class TabCategories extends StatelessWidget {
  final String title;
  TabCategories({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildTitle(title),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            buildCategories(
              Colors.blue[50], // warna container
              xUrlMasjidIcon, // url gambar
              xJadwal,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SholatView(),
                  ),
                );
              },
            ),
            buildCategories(
              Colors.green[50], // warna container
              xUrlArticleIcon, // url gambar
              xArtikel,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticleView(),
                  ),
                );
              },
            ),
            buildCategories(
              Colors.red[50], // warna container
              xUrlMapIcon, // url gambar
              xMap,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MasjidMapView(),
                  ),
                );
              },
            ),
            buildCategories(
              Colors.purple[50], // warna container
              xUrlMenuIcon, // url gambar
              xLainnya,
              () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget buildCategories(
      Color color, String urlimage, String title, Function onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: SvgPicture.asset(
                urlimage,
                height: 25,
                width: 25,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(title)
        ],
      ),
    );
  }

  Widget buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0),
      child: Text(title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
