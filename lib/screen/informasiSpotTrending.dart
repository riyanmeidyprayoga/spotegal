import 'package:flutter/material.dart';
import 'package:spotegal/models/trendingModel.dart';

class InformasiSpotTrending extends StatefulWidget {
  final TrendingModel model;
  InformasiSpotTrending(this.model);
  @override
  _InformasiSpotTrendingState createState() => _InformasiSpotTrendingState();
}

class _InformasiSpotTrendingState extends State<InformasiSpotTrending> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(),
                      child: InkWell(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              new Text(
                                "Informasi :",
                                style: TextStyle(
                                  fontFamily: "FontFavoritBold",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
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
                      padding: const EdgeInsets.only(bottom: 10.0, top: 5),
                      child: InkWell(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: Row(
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: Image.asset(
                                        "assets/img/ic_lokasi.png",
                                        height: 20,
                                        width: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("Lokasi :",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontFamily: ("FontBiasa"),
                                          fontSize: 15,
                                        )),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(widget.model.nmTempat,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontFamily: ("FontBiasa"),
                                          fontSize: 15,
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: Row(
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: Image.asset(
                                        "assets/img/ic_rupiah.png",
                                        height: 20,
                                        width: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("Tiket :",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontFamily: ("FontBiasa"),
                                          fontSize: 15,
                                        )),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(widget.model.harga,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontFamily: ("FontBiasa"),
                                          fontSize: 15,
                                        )),
                                    Text(" / Orang",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontFamily: ("FontBiasa"),
                                          fontSize: 15,
                                        )),
                                  ],
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
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Deskripsi :",
                      style: TextStyle(
                        fontFamily: "FontFavoritBold",
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
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
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: InkWell(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              new Text(
                                widget.model.desc_spot,
                                style: TextStyle(
                                  fontFamily: "FontBiasa",
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
