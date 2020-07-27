import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:spotegal/models/model_kt_tempat.dart';
import 'package:spotegal/models/model_tempat.dart';
import 'dart:async';
import 'dart:convert';

import 'package:spotegal/utils/constans_util.dart';

import 'detail_tempat.dart';

class DetailTempatByKt extends StatefulWidget {
  final ModelKtTempat model;

  DetailTempatByKt({this.model});

  @override
  _DetailTempatByKtState createState() => _DetailTempatByKtState();
}

class _DetailTempatByKtState extends State<DetailTempatByKt> {
  var loading = false;

  List<ModelTempat> _listTempatByKt = [];
  Future<Null> _fetchDataTempatByKt() async {
    setState(() {
      loading = true;
    });
    final response = await http.post(ConstantsUtil.getKategoriTempat(), body: {
      'id_kt_tempat': widget.model.idKtTempat,
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (this.mounted) {
        setState(() {
          for (Map i in data) {
            _listTempatByKt.add(ModelTempat.fromJson(i));
          }
          loading = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchDataTempatByKt();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text("Kategori " + widget.model.nmKtTempat),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(bottom: 5),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Image.network(
                  "${ConstantsUtil.imgUrlTmptKT}/${widget.model.imgKtTempat}",
                  height: 150,
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(left: 0),
                  children: <Widget>[
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
                            children: <Widget>[
                              Text(
                                "List Tempat erdasarkan Kategori " +
                                    widget.model.nmKtTempat,
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
                              Padding(
                                padding: EdgeInsets.only(),
                                child: ListView.builder(
                                  padding: EdgeInsets.only(top: 0),
                                  primary: false,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: _listTempatByKt.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final listData = _listTempatByKt[index];
                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 0),
                                      child: InkWell(
                                        child: Container(
                                          height: 75,
                                          // color: Colors.blue,
                                          child: Column(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: Row(
                                                  children: <Widget>[
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      child: Image.network(
                                                        "${ConstantsUtil.imgUrlTmpt}/${listData.imgTempat}",
                                                        height: 60,
                                                        width: 100,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Text(
                                                              listData.nmTempat,
                                                              overflow:
                                                                  TextOverflow
                                                                      .clip,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    ("FontJudul"),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              )),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 0),
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0),
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/img/ic_lokasi.png",
                                                                    height: 15,
                                                                    width: 15,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Text(
                                                                    listData
                                                                        .lokTempat,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    maxLines: 2,
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          ("FontBiasa"),
                                                                      fontSize:
                                                                          12,
                                                                    )),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 0),
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0),
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/img/ic_rupiah.png",
                                                                    height: 15,
                                                                    width: 15,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Text(
                                                                    listData
                                                                        .tktTempat,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    maxLines: 2,
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          ("FontBiasa"),
                                                                      fontSize:
                                                                          12,
                                                                    )),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: Container(
                                                  height: 2,
                                                  color: Colors.blue[100],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (BuildContext context) {
                                                return DetailTempat(
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
