// To parse this JSON data, do
//
//     final shalat = shalatFromJson(jsonString);

import 'dart:convert';

import 'package:islami/modules/shalat/models/pray_model.dart';

Shalat shalatFromJson(String str) => Shalat.fromJson(json.decode(str));

String shalatToJson(Shalat data) => json.encode(data.toJson());

class Shalat {
  String title;
  String query;
  String shalatFor;
  int method;
  String prayerMethodName;
  String daylight;
  String timezone;
  String mapImage;
  String sealevel;
  TodayWeather todayWeather;
  String link;
  String qiblaDirection;
  String latitude;
  String longitude;
  String address;
  String city;
  String state;
  String postalCode;
  String country;
  String countryCode;
  List<Item> items;
  int statusValid;
  int statusCode;
  String statusDescription;

  Shalat({
    this.title,
    this.query,
    this.shalatFor,
    this.method,
    this.prayerMethodName,
    this.daylight,
    this.timezone,
    this.mapImage,
    this.sealevel,
    this.todayWeather,
    this.link,
    this.qiblaDirection,
    this.latitude,
    this.longitude,
    this.address,
    this.city,
    this.state,
    this.postalCode,
    this.country,
    this.countryCode,
    this.items,
    this.statusValid,
    this.statusCode,
    this.statusDescription,
  });

  factory Shalat.fromJson(Map<String, dynamic> json) => Shalat(
        title: json["title"],
        query: json["query"],
        shalatFor: json["for"],
        method: json["method"],
        prayerMethodName: json["prayer_method_name"],
        daylight: json["daylight"],
        timezone: json["timezone"],
        mapImage: json["map_image"],
        sealevel: json["sealevel"],
        todayWeather: TodayWeather.fromJson(json["today_weather"]),
        link: json["link"],
        qiblaDirection: json["qibla_direction"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        postalCode: json["postal_code"],
        country: json["country"],
        countryCode: json["country_code"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        statusValid: json["status_valid"],
        statusCode: json["status_code"],
        statusDescription: json["status_description"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "query": query,
        "for": shalatFor,
        "method": method,
        "prayer_method_name": prayerMethodName,
        "daylight": daylight,
        "timezone": timezone,
        "map_image": mapImage,
        "sealevel": sealevel,
        "today_weather": todayWeather.toJson(),
        "link": link,
        "qibla_direction": qiblaDirection,
        "latitude": latitude,
        "longitude": longitude,
        "address": address,
        "city": city,
        "state": state,
        "postal_code": postalCode,
        "country": country,
        "country_code": countryCode,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "status_valid": statusValid,
        "status_code": statusCode,
        "status_description": statusDescription,
      };
}

// class Item {
//   String dateFor;
//   String fajr;
//   String shurooq;
//   String dhuhr;
//   String asr;
//   String maghrib;
//   String isha;

//   Item({
//     this.dateFor,
//     this.fajr,
//     this.shurooq,
//     this.dhuhr,
//     this.asr,
//     this.maghrib,
//     this.isha,
//   });

//   factory Item.fromJson(Map<String, dynamic> json) => Item(
//         dateFor: json["date_for"],
//         fajr: json["fajr"],
//         shurooq: json["shurooq"],
//         dhuhr: json["dhuhr"],
//         asr: json["asr"],
//         maghrib: json["maghrib"],
//         isha: json["isha"],
//       );

//   Map<String, dynamic> toJson() => {
//         "date_for": dateFor,
//         "fajr": fajr,
//         "shurooq": shurooq,
//         "dhuhr": dhuhr,
//         "asr": asr,
//         "maghrib": maghrib,
//         "isha": isha,
//       };
// }

class TodayWeather {
  dynamic pressure;
  dynamic temperature;

  TodayWeather({
    this.pressure,
    this.temperature,
  });

  factory TodayWeather.fromJson(Map<String, dynamic> json) => TodayWeather(
        pressure: json["pressure"],
        temperature: json["temperature"],
      );

  Map<String, dynamic> toJson() => {
        "pressure": pressure,
        "temperature": temperature,
      };
}
