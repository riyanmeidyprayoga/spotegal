import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotegal/custom/constPref.dart';
import 'package:spotegal/custom/itemLabelSpot.dart';
import 'package:spotegal/models/feedModel.dart';
import 'package:spotegal/models/model_spot.dart';
import 'package:spotegal/models/model_tempat.dart';
import 'package:spotegal/respository/feedRepository.dart';
import 'package:spotegal/respository/spotRepository.dart';
import 'package:spotegal/screen/upload_feed_posting.dart';
import 'package:spotegal/utils/constans_util.dart';
import 'package:http/http.dart' as http;

import 'feedDetail.dart';

class FeedTempat extends StatefulWidget {
  final ModelTempat model;

  const FeedTempat({Key key, this.model}) : super(key: key);

  @override
  _FeedTempatState createState() => _FeedTempatState();
}

class _FeedTempatState extends State<FeedTempat> {
  bool login = false;
  String idUsers;
  String namaLengkap, photo;
  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      idUsers = pref.getString(Pref.id);
      namaLengkap = pref.getString(Pref.namaLengkap);
      photo = pref.getString(Pref.photo);
      login = pref.getBool(Pref.login) ?? false;
    });
    getSpot();
  }

  List<FeedModel> list = [];
  FeedRepository feedRepository = FeedRepository();
  var cekData = true;
  var loading = false;

  SpotRepository spotRepository = SpotRepository();

  int selectIndex = 0;

  var kategoriSpot = false;
  var loadingSpot = false;
  List<ModelSpot> listSpot = [];
  getSpot() async {
    setState(() {
      loadingSpot = true;
    });
    listSpot.clear();
    final response = await http.post(ConstantsUtil.getTempatSpot(), body: {
      "id_tempat": widget.model.idTempat,
    });
    if (response.statusCode == 200) {
      if (response.contentLength == 2) {
        setState(() {
          loadingSpot = false;
        });
      } else {
        final data = jsonDecode(response.body);
        setState(() {
          loadingSpot = false;
          for (Map i in data) {
            listSpot.add(ModelSpot.fromJson(i));
          }
          kategoriSpot = true;
          selectIndex = int.parse(listSpot[0].idSpot);
        });
        fetchData(selectIndex.toString());
      }
    } else {
      setState(() {
        loadingSpot = false;
      });
      kategoriSpot = false;
      loadingSpot = false;
    }
  }

  fetchData(String index) async {
    await feedRepository.fetchData(list, () {
      setState(() {
        loading = true;
      });
    }, index.toString());
  }

  execute(FeedModel model) async {
    final response = await http.post(ConstantsUtil.viewFeed(), body: {
      "idUsers": idUsers,
      "idFeed": model.id,
    });
    final data = jsonDecode(response.body);
    print(data);
  }

  sessionSignOut() async {}
  Future<void> onRefresh() async {
    getPref();
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  void dispose() {
    super.dispose();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8),
      child: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          login
              ? Container(
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 16,
                      ),
                      photo != null
                          ? Container(
                              height: 60,
                              width: 60,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(3600),
                                child: Image.network(photo),
                              ),
                            )
                          : SizedBox(),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              "$namaLengkap",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UploadFeed(
                                        idSpot: selectIndex.toString(),
                                        reload: () {
                                          setState(() {
                                            getPref();
                                          });
                                        },
                                      )));
                        },
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.camera_alt,
                              size: 30,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Icon(
                              Icons.photo,
                              size: 30,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              : SizedBox(),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: [
                Container(
                  height: 50,
                  child: ListView.builder(
                    itemCount: listSpot.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      final a = listSpot[i];
                      return LabelItemSpot(
                        index: selectIndex,
                        model: a,
                        onPress: () {
                          setState(() {
                            selectIndex = int.parse(a.idSpot);
                            fetchData(selectIndex.toString());
                          });
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                cekData
                    ? StaggeredGridView.countBuilder(
                        crossAxisCount: 9,
                        staggeredTileBuilder: (int index) =>
                            new StaggeredTile.fit(3),
                        padding: EdgeInsets.all(16),
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        itemCount: list.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, i) {
                          final a = list[i];
                          return InkWell(
                            onTap: () {
                              setState(() {
                                login ? execute(a) : sessionSignOut();
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FeedDetail(
                                            model: a,
                                          )));
                            },
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      "${ConstantsUtil.imgUrlFeed}/${a.photo}",
                                      fit: BoxFit.cover,
                                      height: 120,
                                      width: 120,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Mohon Maaf belum ada data",
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
