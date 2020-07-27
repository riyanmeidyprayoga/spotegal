import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotegal/custom/constPref.dart';
import 'package:spotegal/custom/dynamicLinkServices.dart';
import 'package:spotegal/models/feedModel.dart';
import 'package:spotegal/screen/feedDetailEdit.dart';
import 'package:spotegal/utils/constans_util.dart';
import 'package:http/http.dart' as http;

class FeedDetail extends StatefulWidget {
  final FeedModel model;
  final VoidCallback reload;
  const FeedDetail({Key key, this.model, this.reload}) : super(key: key);
  @override
  _FeedDetailState createState() => _FeedDetailState();
}

class _FeedDetailState extends State<FeedDetail> {
  String idUsers;

  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      idUsers = pref.getString(Pref.id);
    });
  }

  DynamicLinkService _dynamicLinkService = DynamicLinkService();
  var url;
  shareLink() async {
    url = await _dynamicLinkService.createFirstPostLink(widget.model.id);
    Share.share("Kunjungi link berikut untuk mengetahui detail spot kami $url");
    print(url);
  }

  delete(FeedModel model) async {
    final response =
        await http.post(ConstantsUtil.deleteFeed(), body: {"id": model.id});
    final data = jsonDecode(response.body);
    int value = data['value'];
    if (value == 1) {
      Navigator.pop(context);
      setState(() {
        widget.reload();
      });
    } else {}
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          color: Colors.lightBlue,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 5, right: 5, top: 30, bottom: 5),
            child: Row(
              children: <Widget>[
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20,
                    )),
                SizedBox(
                  width: 16,
                ),
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
        Expanded(
            child: ListView(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(3600),
                        child: Image.network(widget.model.photoUploaders)),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "${widget.model.namaLengkap}",
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
                  idUsers == widget.model.idMember
                      ? InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                            setState(() {
                                              Navigator.pop(context);
                                            });
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        UploadFeedEdit(
                                                          model: widget.model,
                                                          reload: widget.reload,
                                                        )));
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(16),
                                            child: Text("Edit Feed"),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 2,
                                          ),
                                          child: Divider(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: Text("Warning"),
                                                    content: Text(
                                                        "Anda yakin akan menghapus postingan ini?"),
                                                    actions: <Widget>[
                                                      FlatButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text("Tidak")),
                                                      FlatButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                            delete(
                                                                widget.model);
                                                          },
                                                          child: Text("Ya")),
                                                    ],
                                                  );
                                                });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(16),
                                            child: Text(
                                              "Delete Feed",
                                              style: TextStyle(
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Icon(Icons.menu))
                      : SizedBox(),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Image.network(
              "${ConstantsUtil.imgUrlFeed}/${widget.model.photo}",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 8,
                      ),
                      Spacer(),
                      InkWell(
                          onTap: () {
                            shareLink();
                          },
                          child: Icon(Icons.share)),
                      
                      // Text("Trending")
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text("${widget.model.caption}")
                ],
              ),
            )
          ],
        )),
      ],
    ));
  }
}
