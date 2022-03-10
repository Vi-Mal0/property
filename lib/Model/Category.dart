class Category {
  String? name;
  String? slug;
  int? id;
  String? description;
  String? icon;

  @override
  String toString() {
    return 'Category{name: $name, slug: $slug, id: $id, description: $description, icon: $icon}';
  }

  Category({this.name, this.slug, this.id, this.description, this.icon});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    id = json['id'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['slug'] = slug;
    data['id'] = id;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }
}
