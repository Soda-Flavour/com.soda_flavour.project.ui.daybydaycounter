class DayItem {
  int id;
  int titleId;
  String description;
  int dateTime;

  DayItem(this.id, this.titleId, this.description, this.dateTime);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) map['id'] = id;
    map['title_id'] = titleId;
    map['description'] = description;
    map['date'] = dateTime;
    return map;
  }

  DayItem.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.titleId = map['title_id'];
    this.description = map['description'];
    this.dateTime = map['date'];
  }
}
