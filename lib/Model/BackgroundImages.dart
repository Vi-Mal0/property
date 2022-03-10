class BackgroundImages {
  String? title;
  String? image;
  int? id;

  @override
  String toString() {
    return 'BackgroundImages{title: $title, image: $image, id: $id}';
  }

  BackgroundImages({this.title, this.image, this.id});

  BackgroundImages.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['image'] = image;
    data['id'] = id;
    return data;
  }
}