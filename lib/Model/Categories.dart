class Categories {
  String? name;
  String? slug;
  String? icon;

  @override
  String toString() {
    return 'Categories{name: $name, slug: $slug, icon: $icon}';
  }

  Categories({this.name, this.slug, this.icon});

  Categories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['slug'] = slug;
    data['icon'] = icon;
    return data;
  }
}
