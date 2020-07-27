import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:spotegal/models/model_tempat.dart';
import 'package:spotegal/screen/detail_tempat.dart';
import 'package:spotegal/utils/constans_util.dart';

class PageMaps extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<PageMaps> {
  Completer<GoogleMapController> _controller = Completer();
  var loading = false;
  ImageConfiguration imageConfiguration = ImageConfiguration();
  static double nLat;
  static double nLong;
  final Set<Marker> _markers = {};
  List<ModelTempat> _listTempat = [];
  Future<Null> _fetchDataTempat() async {
    setState(() {
      loading = true;
    });
    final response = await http.get(ConstantsUtil.getTempat());
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          _listTempat.add(ModelTempat.fromJson(i));
        }
        loading = false;
      });
      setState(() {
        for (int i = 0; i < _listTempat.length; i++) {
          // 4
          _markers.add(
            Marker(
              icon: BitmapDescriptor.fromAsset("assets/img/ic_marker.png"),
              markerId: MarkerId(_listTempat[i].nmTempat),
              position:
                  LatLng(_listTempat[i].latTempat, _listTempat[i].longTempat),
              infoWindow: InfoWindow(
                  title: "${_listTempat[i].nmTempat}",
                  snippet: "${_listTempat[i].lokTempat}",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailTempat(
                                  model: _listTempat[i],
                                )));
                  }),
              onTap: () {},
            ),
          );
        }
        print("Markers :$_markers");
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchDataTempat();
  }

  double zoomVal = 5.0;
  BitmapDescriptor myIcon;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            _buildGoogleMap(context),
            _buildContainer(),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 25),
        height: 170,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(top: 10),
          primary: false,
          shrinkWrap: true,
          itemCount: _listTempat.length,
          itemBuilder: (BuildContext context, int index) {
            final listData = _listTempat[index];
            return GestureDetector(
              onTap: () {
                _gotoLocation(listData.latTempat, listData.longTempat);
              },
              child: Container(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10, left: 10),
                      child: Container(
                        child: new FittedBox(
                          child: Material(
                              color: Colors.white,
                              elevation: 10.0,
                              borderRadius: BorderRadius.circular(10.0),
                              shadowColor: Color(0x802196F3),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        "${ConstantsUtil.imgUrlTmpt}/${listData.imgTempat}",
                                        height: 100,
                                        width: 180,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    listData.nmTempat,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontFamily: ("FontFavoritBold"),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0),
                                    child: Row(
                                      children: <Widget>[
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          child: Image.asset(
                                            "assets/img/ic_lokasi.png",
                                            height: 15,
                                            width: 15,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(listData.lokTempat,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontFamily: ("FontBiasa"),
                                              fontSize: 13,
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      children: <Widget>[
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          child: Image.asset(
                                            "assets/img/ic_rupiah.png",
                                            height: 15,
                                            width: 15,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(listData.tktTempat,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontFamily: ("FontBiasa"),
                                              fontSize: 13,
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: LatLng(-6.882417, 109.135009), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set<Marker>.of(_markers),
      ),
    );
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 15,
      tilt: 50.0,
      bearing: 0,
    )));
  }
}
