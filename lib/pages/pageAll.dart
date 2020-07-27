import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:spotegal/custom/itemGridTempat.dart';
import 'dart:convert';
import 'dart:async';
import 'package:spotegal/models/model_tempat.dart';
import 'package:spotegal/screen/detail_tempat.dart';
import 'package:spotegal/utils/constans_util.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PageAll extends StatefulWidget {
  @override
  _PageAllState createState() => _PageAllState();
}

class _PageAllState extends State<PageAll> {
  var loading = false;

  List<ModelTempat> _listTempat = [];
  Future<Null> _fetchDataTempat() async {
    setState(() {
      loading = true;
    });
    _listTempat.clear();
    final response = await http.get(ConstantsUtil.getTempat());
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          _listTempat.add(ModelTempat.fromJson(i));
        }
        loading = false;
      });
    }
  }

  Future<void> onRefresh() async {
    _fetchDataTempat();
  }

  @override
  void initState() {
    super.initState();
    _fetchDataTempat();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[100],
        body: Container(
          margin: EdgeInsets.only(bottom: 5),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(),
                child: Container(
                  color: Colors.lightBlue,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 5, right: 5, top: 28, bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/img/ic_logo.png',
                          height: 40,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "All",
                          style: TextStyle(
                              fontFamily: ("FontFavoritBold"),
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Tempat Spot",
                          style: TextStyle(
                              fontFamily: ("FontFavorit"),
                              fontSize: 25,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: onRefresh,
                  child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(),
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(),
                              child: StaggeredGridView.countBuilder(
                                crossAxisCount: 4,
                                padding: EdgeInsets.all(16),
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                itemCount: _listTempat.length,
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                itemBuilder: (context, i) {
                                  final a = _listTempat[i];
                                  return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailTempat(
                                                      model: a,
                                                    )));
                                      },
                                      child: ItemGridTempatWisata(a));
                                },
                                staggeredTileBuilder: (int index) =>
                                    new StaggeredTile.fit(2),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
