import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotegal/custom/constPref.dart';
import 'dart:convert';
import 'dart:async';
import 'package:spotegal/models/model_spot.dart';
import 'package:spotegal/screen/detail_spot.dart';
import 'package:spotegal/utils/constans_util.dart';

class PageUser extends StatefulWidget {
  @override
  _PageUserState createState() => _PageUserState();
}

class _PageUserState extends State<PageUser> {
  String idUsers;
  var login = false;
  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      idUsers = pref.getString(Pref.id);
      login = pref.getBool(Pref.login) ?? false;
    });
    _fetchDataSpot();
  }

  signOut() {}

  // execute(ModelSpot model) async {
  //   final data = await http.post(ConstantsUtil.viewSpot(), body: {
  //     "idUsers": idUsers,
  //     "idSpot": model.idSpot,
  //   });
  //   print(jsonDecode(data.body));
  // }

  var loading = false;

  List<ModelSpot> _listSpot = [];
  Future<Null> _fetchDataSpot() async {
    setState(() {
      loading = true;
    });
    final response = await http.get(ConstantsUtil.getSpot());
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          _listSpot.add(ModelSpot.fromJson(i));
        }
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getPref();
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
                          "Spot Foto",
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
                child: ListView(
                  padding: const EdgeInsets.only(),
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
                              Padding(
                                padding: EdgeInsets.only(),
                                child: ListView.builder(
                                  padding: EdgeInsets.only(top: 5),
                                  primary: false,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: _listSpot.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final listData = _listSpot[index];
                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 0),
                                      child: InkWell(
                                        child: Container(
                                          height: 105,
                                          // color: Colors.blue,
                                          child: Column(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 0),
                                                child: Row(
                                                  children: <Widget>[
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      child: Image.network(
                                                        "${ConstantsUtil.imgUrlSpot}/${listData.imgSpot}",
                                                        height: 90,
                                                        width: 150,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width -
                                                              200,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Text(
                                                              listData.nmSpot,
                                                              overflow:
                                                                  TextOverflow
                                                                      .clip,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    ("FontFavoritBold"),
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                              maxLines: 1,
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
                                                                            .circular(0),
                                                                    child: Image
                                                                        .asset(
                                                                      "assets/img/ic_lokasi.png",
                                                                      height:
                                                                          20,
                                                                      width: 20,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                      listData
                                                                          .loktmpSpot,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      maxLines:
                                                                          2,
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            ("FontBiasa"),
                                                                        fontSize:
                                                                            14,
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
                                                                            .circular(0),
                                                                    child: Image
                                                                        .asset(
                                                                      "assets/img/ic_rupiah.png",
                                                                      height:
                                                                          20,
                                                                      width: 20,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                      listData
                                                                          .tktSpot,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      maxLines:
                                                                          2,
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            ("FontBiasa"),
                                                                        fontSize:
                                                                            14,
                                                                      )),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
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
                                          // setState(() {
                                          //   login
                                          //       ? execute(listData)
                                          //       : signOut();
                                          // });
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (BuildContext context) {
                                                return DetailSpot(
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
