import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:spotegal/models/feedModel.dart';
import 'package:http/http.dart' as http;
import 'package:spotegal/utils/constans_util.dart';

class FeedRepository {
  List<FeedModel> list = [];
  var cekData = false;
  Future fetchData(
    List<FeedModel> list,
    VoidCallback loading,
    String idTempat,
  ) async {
    loading();
    list.clear();
    final response = await http.get(ConstantsUtil.getFeedByTempat(idTempat));
    if (response.statusCode == 200) {
      loading();
      if (response.contentLength == 2) {
        cekData = false;
      } else {
        final data = jsonDecode(response.body);
        print(data);
        for (Map i in data) {
          list.add(FeedModel.fromJson(i));
        }
        cekData = true;
      }
      print(cekData);
    } else {
      loading();
      cekData = false;
      print(cekData);
    }
  }
}
