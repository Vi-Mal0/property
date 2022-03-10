import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:property/Model/Places.dart';

class ApiService{

  Future<Places> getData() async {
    Response res = await get(
        Uri.parse('https://milkiyat.bangalore2.com/api/home/'));
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      return Places.fromJson(body);
    }
    throw Exception('Failed to fetch data');
  }

}