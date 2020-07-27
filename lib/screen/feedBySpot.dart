import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotegal/custom/constPref.dart';
import 'package:spotegal/models/feedModel.dart';
import 'package:spotegal/utils/constans_util.dart';

import 'feedDetail.dart';

class FeedbySpot extends StatefulWidget {
  final String idSpot;
  FeedbySpot(this.idSpot);
  @override
  _FeedbySpotState createState() => _FeedbySpotState();
}

class _FeedbySpotState extends State<FeedbySpot> {
  String idUsers;
  var login = false;
  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      idUsers = pref.getString(Pref.id);
      login = pref.getBool(Pref.login) ?? false;
    });
    _fetchData();
  }

  var cekData = false;
  var loading = false;
  List<FeedModel> list = [];
  _fetchData() async {
    setState(() {
      loading = true;
    });
    list.clear();
    final response =
        await http.post(ConstantsUtil.getFeedByTempat(widget.idSpot));
    if (response.statusCode == 200) {
      if (response.contentLength == 2) {
        setState(() {
          cekData = false;
          loading = false;
        });
      } else {
        final data = jsonDecode(response.body);
        setState(() {
          for (Map i in data) {
            list.add(FeedModel.fromJson(i));
          }
          cekData = true;
          loading = false;
        });
      }
    } else {
      setState(() {
        cekData = false;
        loading = false;
      });
    }
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: [
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
    );
  }
}
