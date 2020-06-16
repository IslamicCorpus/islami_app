import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/const/lang.dart';
import 'package:islami/modules/shalat/models/pray_model.dart';

class SholatSchedule extends StatelessWidget {
  final List<Item> pray;
  SholatSchedule({this.pray});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: pray.length,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (context, index) {
          var time = pray[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 17, vertical: 20),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 17, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildSholatTime(xUrlSeaIcon, "Subuh", time.fajr),
                  Divider(),
                  SizedBox(height: 15),
                  buildSholatTime(xUrlSunIcon, "Zuhur", time.dhuhr),
                  Divider(),
                  SizedBox(height: 15),
                  buildSholatTime(xUrlAfternoonIcon, "Ashar", time.asr),
                  Divider(),
                  SizedBox(height: 15),
                  buildSholatTime(xUrlSunsetIcon, "Maghrib", time.maghrib),
                  Divider(),
                  SizedBox(height: 15),
                  buildSholatTime(xUrlCloudIcon, "Isya'", time.isha),
                  Divider(),
                ],
              ),
            ),
          );
        });
  }

  Widget buildSholatTime(String urlIcon, String title, String time) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SvgPicture.asset(urlIcon, width: 15, height: 15),
        Text(
          title,
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(width: 45),
        Text(
          time,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
