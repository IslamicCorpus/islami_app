import 'package:flutter/material.dart';
import 'package:islami/modules/shalat/services/shalat_services.dart';
import 'package:islami/modules/shalat/widgets/appbar_sholat.dart';
import 'package:islami/modules/shalat/widgets/sholat_schedule.dart';
import 'package:provider/provider.dart';
import 'package:islami/modules/shalat/models/shalat_model.dart';

class SholatView extends StatefulWidget {
  @override
  _SholatViewState createState() => _SholatViewState();
}

class _SholatViewState extends State<SholatView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final shalatProv = Provider.of<ShalatService>(context);
    return Scaffold(
      body: FutureBuilder<Shalat>(
        future: shalatProv.fetchShalatTime(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: CircularProgressIndicator());
          }
          return Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  AppBarSholat(
                    shalat: snapshot.data,
                    items: snapshot.data.items,
                  ),
                  SholatSchedule(pray: snapshot.data.items),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
