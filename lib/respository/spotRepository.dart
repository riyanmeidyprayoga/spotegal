import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:spotegal/models/model_spot.dart';
import 'package:spotegal/utils/constans_util.dart';

class SpotRepository {
  var kategoriSpot = false;
  var loadingSpot = false;
  List<ModelSpot> listSpot = [];
  getSpot(
      List<ModelSpot> listSpot, VoidCallback loading, String idTempat) async {
    loading();
    listSpot.clear();
    final response = await http
        .post(ConstantsUtil.getTempatSpot(), body: {"id_tempat": idTempat});
    if (response.statusCode == 200) {
      if (response.contentLength == 2) {
        loading();
      } else {
        final data = jsonDecode(response.body);
        loading();
        for (Map i in data) {
          listSpot.add(ModelSpot.fromJson(i));
        }
        kategoriSpot = true;
        loadingSpot = false;
      }
    } else {
      loading();
      kategoriSpot = false;
      loadingSpot = false;
    }
  }
}
