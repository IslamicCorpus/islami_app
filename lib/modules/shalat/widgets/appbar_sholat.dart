import 'package:flutter/material.dart';
import 'package:islami/const/lang.dart';
import 'package:islami/modules/shalat/models/pray_model.dart';
import 'package:islami/modules/shalat/models/shalat_model.dart';

class AppBarSholat extends StatelessWidget {
  final Shalat shalat;
  final List<Item> items;
  AppBarSholat({this.shalat, this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var prayTime = items[index];
        return Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(15),
                  ),
                  image: DecorationImage(
                    image: AssetImage(xUrlMosque),
                    fit: BoxFit.cover,
                  )),
            ),
            Container(
              width: double.infinity,
              height: 300,
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
                top: 100,
                left: 17,
                right: 17,
                child: Container(
                  width: 500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${shalat.city}, ${shalat.state},\n${shalat.country}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        prayTime.dateFor,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                )),
          ],
        );
      },
    );
  }
}
