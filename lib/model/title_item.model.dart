// To parse this JSON data, do
//
//     final titleItem = titleItemFromJson(jsonString);

import 'dart:convert';

TitleItem titleItemFromJson(String str) => TitleItem.fromJson(json.decode(str));

String titleItemToJson(TitleItem data) => json.encode(data.toJson());

class TitleItem {
  TitleItem({
    this.id,
    this.title,
    this.dateTime,
  });

  int id;
  String title;
  String dateTime;

  factory TitleItem.fromJson(Map<String, dynamic> json) => TitleItem(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        dateTime: json["dateTime"] == null ? null : json["dateTime"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "dateTime": dateTime == null ? null : dateTime,
      };
}
