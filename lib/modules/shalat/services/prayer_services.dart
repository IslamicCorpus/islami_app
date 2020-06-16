// import 'dart:convert';

// import 'package:flutter/foundation.dart';
// import 'package:islami/modules/shalat/models/pray_model.dart';
// import 'package:islami/modules/shalat/models/shalat_model.dart';
// import 'package:http/http.dart' as http;

// class PrayerService extends ChangeNotifier {
//   List<Pray> _prayer;
//   List<Pray> get prayer => _prayer;

//   set prayer(List<Pray> val) {
//     _prayer = val;
//     notifyListeners();
//   }

//   Future<List<Pray>> fetchPrayer() async {
//     final response =
//         await http.get("http://muslimsalat.com/ketapang/daily.json");

//     var resPrayer = jsonDecode(response.body);
//     List prayerResult = resPrayer['items'];
//     // print(resMovieResult);
//     List<Pray> data = [];

//     for (var i = 0; i < prayerResult.length; i++) {
//       var film = Pray.fromJson(prayerResult[i]);
//       data.add(film);
//     }

//     return data;
//   }
// }
