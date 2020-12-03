// To parse this JSON data, do
//
//     final mainItem = mainItemFromJson(jsonString);

import 'dart:convert';

MainItem mainItemFromJson(String str) => MainItem.fromJson(json.decode(str));

String mainItemToJson(MainItem data) => json.encode(data.toJson());

class MainItem {
  MainItem({
    this.id,
    this.title,
    this.dateTime,
    this.cnt,
  });

  int id;
  String title;
  int dateTime;
  int cnt;

  factory MainItem.fromJson(Map<String, dynamic> json) => MainItem(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        dateTime: json["dateTime"] == null ? null : json["dateTime"],
        cnt: json["cnt"] == null ? null : json["cnt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "dateTime": dateTime == null ? null : dateTime,
        "cnt": cnt == null ? null : cnt,
      };
}
