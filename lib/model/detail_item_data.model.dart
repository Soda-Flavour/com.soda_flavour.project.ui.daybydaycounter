// To parse this JSON data, do
//
//     final detailItemDataModel = detailItemDataModelFromJson(jsonString);

import 'dart:convert';

DetailItemDataModel detailItemDataModelFromJson(String str) =>
    DetailItemDataModel.fromJson(json.decode(str));

String detailItemDataModelToJson(DetailItemDataModel data) =>
    json.encode(data.toJson());

class DetailItemDataModel {
  DetailItemDataModel({
    this.totalCount,
    this.todayCount,
    this.dayAvg,
    this.weekAvg,
    this.dayItem,
  });

  int totalCount;
  int todayCount;
  int dayAvg;
  int weekAvg;
  List<DayItem> dayItem;

  factory DetailItemDataModel.fromJson(Map<String, dynamic> json) =>
      DetailItemDataModel(
        totalCount: json["totalCount"] == null ? null : json["totalCount"],
        todayCount: json["todayCount"] == null ? null : json["todayCount"],
        dayAvg: json["dayAvg"] == null ? null : json["dayAvg"],
        weekAvg: json["weekAvg"] == null ? null : json["weekAvg"],
        dayItem: json["dayItem"] == null
            ? null
            : List<DayItem>.from(
                json["dayItem"].map((x) => DayItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalCount": totalCount == null ? null : totalCount,
        "todayCount": todayCount == null ? null : todayCount,
        "dayAvg": dayAvg == null ? null : dayAvg,
        "weekAvg": weekAvg == null ? null : weekAvg,
        "dayItem": dayItem == null
            ? null
            : List<dynamic>.from(dayItem.map((x) => x.toJson())),
      };
}

class DayItem {
  DayItem({
    this.date,
    this.dayCount,
    this.dayTimeList,
  });

  String date;
  int dayCount;
  List<DayTimeList> dayTimeList;

  factory DayItem.fromJson(Map<String, dynamic> json) => DayItem(
        date: json["date"] == null ? null : json["date"],
        dayCount: json["dayCount"] == null ? null : json["dayCount"],
        dayTimeList: json["dayTimeList"] == null
            ? null
            : List<DayTimeList>.from(
                json["dayTimeList"].map((x) => DayTimeList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date": date == null ? null : date,
        "dayCount": dayCount == null ? null : dayCount,
        "dayTimeList": dayTimeList == null
            ? null
            : List<dynamic>.from(dayTimeList.map((x) => x.toJson())),
      };
}

class DayTimeList {
  DayTimeList({
    this.id,
    this.time,
  });

  int id;
  String time;

  factory DayTimeList.fromJson(Map<String, dynamic> json) => DayTimeList(
        id: json["id"] == null ? null : json["id"],
        time: json["time"] == null ? null : json["time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "time": time == null ? null : time,
      };
}
