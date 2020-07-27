import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:spotegal/models/model_kt_tempat.dart';
import 'package:spotegal/models/trendingModel.dart';
import 'package:spotegal/respository/trendingRepository.dart';
import 'package:spotegal/screen/detail_kt_tempat.dart';
import 'package:spotegal/screen/detail_spot_trending.dart';
import 'package:spotegal/utils/constans_util.dart';

class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  var loading = false;

  List<ModelKtTempat> _listKtTempat = [];
  Future<Null> _fetchDataKtTempat() async {
    setState(() {
      loading = true;
    });
    _listKtTempat.clear();
    final response = await http.get(ConstantsUtil.getKategori());
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          _listKtTempat.add(ModelKtTempat.fromJson(i));
        }
        loading = false;
      });
    }
  }

  List<TrendingModel> list = [];

  TrendingRepository trendingRepository = TrendingRepository();
  _fetchData() async {
    await trendingRepository.fetchDataSpotTrending(
      list,
      () {
        setState(() {
          loading = true;
        });
      },
    );
  }

  Future<void> onRefresh() async {
    _fetchDataKtTempat();
    _fetchData();
    print("Refresh");
  }

  @override
  void initState() {
    super.initState();
    _fetchDataKtTempat();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[100],
        body: RefreshIndicator(
          onRefresh: onRefresh,
          child: Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                            "SPOT",
                            style: TextStyle(
                                fontFamily: ("FontFavoritBold"),
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "egal",
                            style: TextStyle(
                                fontFamily: ("FontFavorit"),
                                fontSize: 25,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Apps",
                            style: TextStyle(
                                fontFamily: ("FontFavorit"),
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(),
                    children: <Widget>[
                      SizedBox(
                          height: 250,
                          child: Carousel(
                            images: [
                              ExactAssetImage("assets/img/slide/ss1.jpg"),
                              ExactAssetImage("assets/img/slide/ss2.jpg"),
                              ExactAssetImage("assets/img/slide/ss3.jpg"),
                              ExactAssetImage("assets/img/slide/ss4.jpg"),
                              ExactAssetImage("assets/img/slide/ss5.jpg"),
                            ],
                            dotSize: 4.0,
                            dotSpacing: 15.0,
                            dotColor: Colors.lightBlue,
                            indicatorBgPadding: 5.0,
                            dotBgColor: Colors.blue.withOpacity(0.5),
                          )),
                      SizedBox(
                        height: 9,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Kategori Tempat",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "FontFavoritBold",
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Container(
                                    height: 3,
                                    color: Colors.blue[100],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 5, right: 5, top: 10),
                                  height: 100,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    primary: false,
                                    itemCount: _listKtTempat.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final listData = _listKtTempat[index];
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: InkWell(
                                          child: Container(
                                            child: Column(
                                              children: <Widget>[
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.network(
                                                    "${ConstantsUtil.imgUrlTmptKT}/${listData.imgKtTempat}",
                                                    height: 62,
                                                    width: 62,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(height: 7),
                                                Container(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    listData.nmKtTempat,
                                                    style: TextStyle(
                                                      fontFamily: "FontBiasa",
                                                      fontSize: 12,
                                                    ),
                                                    maxLines: 2,
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                                SizedBox(height: 3),
                                              ],
                                            ),
                                          ),
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) {
                                                  return DetailTempatByKt(
                                                    model: listData,
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 5),
                        child: Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Trending Spot Foto :",
                                  style: TextStyle(
                                    fontFamily: "FontFavoritBold",
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Container(
                                    height: 3,
                                    color: Colors.blue[100],
                                  ),
                                ),
                                list.length == 0
                                    ? Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              "Mohon maaf hari ini belum ada data trending",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      )
                                    : Padding(
                                        padding: EdgeInsets.only(),
                                        child: ListView.builder(
                                          padding: EdgeInsets.only(top: 0),
                                          primary: false,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: list.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            final listData = list[index];
                                            var no = index + 1;
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 0),
                                              child: InkWell(
                                                child: Container(
                                                  height: 75,
                                                  // color: Colors.blue,
                                                  child: Column(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 5),
                                                        child: Row(
                                                          children: <Widget>[
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              child:
                                                                  Image.network(
                                                                "${ConstantsUtil.imgUrlSpot}/${listData.photo}",
                                                                height: 60,
                                                                width: 100,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            10),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: <
                                                                      Widget>[
                                                                    Text(
                                                                        listData
                                                                            .nmSpot,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .clip,
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              ("FontJudul"),
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        )),
                                                                    SizedBox(
                                                                      height: 5,
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              0),
                                                                      child:
                                                                          Row(
                                                                        children: <
                                                                            Widget>[
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(0),
                                                                            child:
                                                                                Image.asset(
                                                                              "assets/img/ic_lokasi.png",
                                                                              height: 15,
                                                                              width: 15,
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                5,
                                                                          ),
                                                                          Text(
                                                                              listData.nmTempat,
                                                                              overflow: TextOverflow.ellipsis,
                                                                              maxLines: 2,
                                                                              style: TextStyle(
                                                                                fontFamily: ("FontBiasa"),
                                                                                fontSize: 12,
                                                                              )),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 5,
                                                                    ),
                                                                    Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: <
                                                                          Widget>[
                                                                        Expanded(
                                                                          child:
                                                                              Row(
                                                                            children: <Widget>[
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(0),
                                                                                child: Image.asset(
                                                                                  "assets/img/ic_rupiah.png",
                                                                                  height: 15,
                                                                                  width: 15,
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                width: 5,
                                                                              ),
                                                                              Text(listData.harga,
                                                                                  style: TextStyle(
                                                                                    fontFamily: ("FontBiasa"),
                                                                                    fontSize: 12,
                                                                                  )),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                            "Trending $no",
                                                                            style:
                                                                                TextStyle(
                                                                              fontFamily: ("FontBiasa"),
                                                                              fontSize: 12,
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
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 5),
                                                        child: Container(
                                                          height: 2,
                                                          color:
                                                              Colors.blue[100],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            DetailSpotTrending(
                                                          model: listData,
                                                        ),
                                                      ));
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
