import 'dart:convert';

DayCount clientFromJson(String str) {
  final jsonData = json.decode(str);
  return DayCount.fromMap(jsonData);
}

String clientToJson(DayCount data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class DayCount {
  int id;
  String title;
  int date;

  DayCount({this.id, this.title, this.date});

  factory DayCount.fromMap(Map<String, dynamic> json) => new DayCount(
    id: json["id"],
    title: json["title"],
    date: json["date"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "date": date,
  };
}