import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:spotegal/models/model_spot.dart';
import 'package:spotegal/models/model_tempat.dart';
import 'package:spotegal/utils/constans_util.dart';

import 'package:http/http.dart' as http;

import 'detail_spot.dart';

class InformasiDetailTempat extends StatefulWidget {
  final ModelTempat model;

  const InformasiDetailTempat({Key key, this.model}) : super(key: key);
  @override
  _InformasiDetailTempatState createState() => _InformasiDetailTempatState();
}

class _InformasiDetailTempatState extends State<InformasiDetailTempat> {
  Completer<GoogleMapController> _controller = Completer();
  var loading = false;
  List<ModelSpot> _listSpotByTempat = [];
  Future<Null> _fetchDataSpotByTempat() async {
    setState(() {
      loading = true;
    });
    final response = await http.post(ConstantsUtil.getTempatSpot(), body: {
      'id_tempat': widget.model.idTempat,
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (this.mounted) {
        setState(() {
          for (Map i in data) {
            _listSpotByTempat.add(ModelSpot.fromJson(i));
          }
          loading = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchDataSpotByTempat();
    // double a = widget.model.latTempat;
    // double b = widget.model.longTempat;
    // nLat = a;
    // nLong = b;
  }

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
                                    Text(widget.model.lokTempat,
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
                                    Text(widget.model.tktTempat,
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
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
            ),
            child: Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Spot Foto " + widget.model.nmTempat + " :",
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
                        itemCount: _listSpotByTempat.length,
                        itemBuilder: (BuildContext context, int index) {
                          final listData = _listSpotByTempat[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: InkWell(
                              child: Container(
                                height: 75,
                                // color: Colors.blue,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Row(
                                        children: <Widget>[
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: Image.network(
                                              "${ConstantsUtil.imgUrlSpot}/${listData.imgSpot}",
                                              height: 60,
                                              width: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(listData.nmSpot,
                                                    overflow: TextOverflow.clip,
                                                    style: TextStyle(
                                                      fontFamily: ("FontJudul"),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 0),
                                                  child: Row(
                                                    children: <Widget>[
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0),
                                                        child: Image.asset(
                                                          "assets/img/ic_lokasi.png",
                                                          height: 15,
                                                          width: 15,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(listData.loktmpSpot,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 2,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                ("FontBiasa"),
                                                            fontSize: 12,
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 0),
                                                  child: Row(
                                                    children: <Widget>[
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0),
                                                        child: Image.asset(
                                                          "assets/img/ic_rupiah.png",
                                                          height: 15,
                                                          width: 15,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(listData.tktSpot,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 2,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                ("FontBiasa"),
                                                            fontSize: 12,
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
                                      padding: const EdgeInsets.only(top: 5),
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
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
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
                      "Maps :",
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
                      padding: const EdgeInsets.only(bottom: 10, top: 5),
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: GoogleMap(
                          mapType: MapType.normal,
                          initialCameraPosition: CameraPosition(
                              target: LatLng(widget.model.latTempat,
                                  widget.model.longTempat),
                              zoom: 12),
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                          },
                          markers: {
                            Marker(
                              markerId: MarkerId(''),
                              position: LatLng(widget.model.latTempat,
                                  widget.model.longTempat),
                              infoWindow:
                                  InfoWindow(title: widget.model.nmTempat),
                              icon: BitmapDescriptor.fromAsset(
                                  "assets/img/ic_marker.png"),
                            ),
                          },
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
                                widget.model.desTempat,
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
