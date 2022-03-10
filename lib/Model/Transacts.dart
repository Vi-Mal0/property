class Transacts {
  String? name;
  int? id;
  String? slug;
  String? labelSeller;
  String? labelBuyer;
  String? icon;
  String? priceUnit;


  @override
  String toString() {
    return 'Transacts{name: $name, id: $id, slug: $slug, labelSeller: $labelSeller, labelBuyer: $labelBuyer, icon: $icon, priceUnit: $priceUnit}';
  }

  Transacts(
      {this.name,
        this.id,
        this.slug,
        this.labelSeller,
        this.labelBuyer,
        this.icon,
        this.priceUnit});

  Transacts.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    slug = json['slug'];
    labelSeller = json['label_seller'];
    labelBuyer = json['label_buyer'];
    icon = json['icon'];
    priceUnit = json['price_unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['slug'] = slug;
    data['label_seller'] = labelSeller;
    data['label_buyer'] = labelBuyer;
    data['icon'] = icon;
    data['price_unit'] = priceUnit;
    return data;
  }
}
