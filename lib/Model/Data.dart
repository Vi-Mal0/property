import 'Items.dart';

class Data {
  String? type;
  List<Items>? items;
  String? title;
  String? summary;
  int? icon;
  bool? twoLine;
  String? seeAll;

  Data(
      {this.type,
      this.items,
      this.title,
      this.summary,
      this.icon,
      this.twoLine,
      this.seeAll});

  @override
  String toString() {
    return 'Data{type: $type, items: $items, title: $title, summary: $summary, icon: $icon, twoLine: $twoLine, seeAll: $seeAll}';
  }

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
    title = json['title'];
    summary = json['summary'];
    icon = json['icon'];
    twoLine = json['two_line'];
    seeAll = json['see_all'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (items != null) {
      data['items'] = items?.map((v) => v.toJson()).toList();
    }
    data['title'] = title;
    data['summary'] = summary;
    data['icon'] = icon;
    data['two_line'] = twoLine;
    data['see_all'] = seeAll;
    return data;
  }
}
