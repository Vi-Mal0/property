import 'BackgroundImages.dart';
import 'Categories.dart';
import 'Data.dart';
import 'Transacts.dart';

class Places {
  List<Categories>? categories;
  List<Data>? data;
  List<Transacts>? transacts;
  List<BackgroundImages>? backgroundImages;

  @override
  String toString() {
    return 'Places{categories: $categories, data: $data, transacts: $transacts, backgroundImages: $backgroundImages}';
  }

  Places({this.categories, this.data, this.transacts, this.backgroundImages});

  Places.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    if (json['transacts'] != null) {
      transacts = [];
      json['transacts'].forEach((v) {
        transacts?.add(Transacts.fromJson(v));
      });
    }
    if (json['background_images'] != null) {
      backgroundImages = [];
      json['background_images'].forEach((v) {
        backgroundImages?.add(BackgroundImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    if (transacts != null) {
      data['transacts'] = transacts?.map((v) => v.toJson()).toList();
    }
    if (backgroundImages != null) {
      data['background_images'] =
          backgroundImages?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}







