import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:islami/modules/shalat/models/shalat_model.dart';
import 'package:http/http.dart' as http;

class ShalatService extends ChangeNotifier {
  Shalat _shalat;
  Shalat get shalat => _shalat;

  set shalat(Shalat val) {
    _shalat = val;
    notifyListeners();
  }

  Future<Shalat> fetchShalatTime() async {
    final response =
        await http.get("http://muslimsalat.com/ketapang/daily.json");

    _shalat = Shalat.fromJson(jsonDecode(response.body));

    return shalat;
  }
}
