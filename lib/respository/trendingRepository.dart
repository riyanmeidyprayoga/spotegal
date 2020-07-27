import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:spotegal/models/trendingModel.dart';
import 'package:spotegal/utils/constans_util.dart';
import 'package:http/http.dart' as http;

class TrendingRepository {
  Future fetchDataSpotTrending(
      List<TrendingModel> _listSpotTrending, VoidCallback loading) async {
    loading();
    _listSpotTrending.clear();
    final response = await http.get(ConstantsUtil.getTrendingSpot());
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      loading();
      for (Map i in data) {
        _listSpotTrending.add(TrendingModel.fromJson(i));
        _listSpotTrending
            .sort((a, b) => b.totalCounting.compareTo(a.totalCounting));
      }
    }
    loading();
  }
}
