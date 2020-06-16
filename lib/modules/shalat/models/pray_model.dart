class Item {
  String dateFor;
  String fajr;
  String shurooq;
  String dhuhr;
  String asr;
  String maghrib;
  String isha;

  Item({
    this.dateFor,
    this.fajr,
    this.shurooq,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.isha,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        dateFor: json["date_for"],
        fajr: json["fajr"],
        shurooq: json["shurooq"],
        dhuhr: json["dhuhr"],
        asr: json["asr"],
        maghrib: json["maghrib"],
        isha: json["isha"],
      );

  Map<String, dynamic> toJson() => {
        "date_for": dateFor,
        "fajr": fajr,
        "shurooq": shurooq,
        "dhuhr": dhuhr,
        "asr": asr,
        "maghrib": maghrib,
        "isha": isha,
      };
}
