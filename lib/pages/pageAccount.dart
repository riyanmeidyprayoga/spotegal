import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotegal/custom/buttonCustom.dart';
import 'package:spotegal/custom/constPref.dart';
import 'package:spotegal/models/feedModel.dart';
import 'package:spotegal/respository/loginRepository.dart';
import 'package:spotegal/screen/feedDetail.dart';
import 'package:spotegal/utils/constans_util.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:async/async.dart';

class PageSetting extends StatefulWidget {
  @override
  _PageSettingState createState() => _PageSettingState();
}

class _PageSettingState extends State<PageSetting> {
  bool login = false;
  String namaLengkap, photo, phone, email, idUsers;
  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      namaLengkap = pref.getString(Pref.namaLengkap);
      photo = pref.getString(Pref.photo);
      phone = pref.getString(Pref.phone);
      idUsers = pref.getString(Pref.id);
      login = pref.getBool(Pref.login) ?? false;
    });
    fetch();
    print("Login Conditions : $login");
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

  signOut() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    GoogleSignIn googleSignIn = GoogleSignIn();
    Navigator.pop(context);
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(Pref.createdDate);
    pref.remove(Pref.email);
    pref.remove(Pref.login);
    pref.remove(Pref.namaLengkap);
    pref.remove(Pref.id);
    pref.remove(Pref.phone);
    pref.remove(Pref.photo);
    _auth.signOut();
    googleSignIn.signOut();
    setState(() {
      getPref();
    });
  }

  LoginRespository loginRespository = LoginRespository();
  loginGoogle() async {
    await loginRespository.handleSignIn(context);
  }

  var cekData = false;
  var loading = false;
  List<FeedModel> list = [];
  fetch() async {
    setState(() {
      loading = true;
    });
    list.clear();
    final response = await http.get(ConstantsUtil.getFeedUsers(idUsers));
    if (response.statusCode == 200) {
      if (response.contentLength == 2) {
        setState(() {
          loading = false;
          cekData = false;
        });
      } else {
        final data = jsonDecode(response.body);
        setState(() {
          for (Map i in data) {
            list.add(FeedModel.fromJson(i));
          }
          loading = false;
          cekData = true;
        });
      }
    } else {
      setState(() {
        loading = false;
        cekData = false;
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
                        Spacer(),
                        login
                            ? InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Platform.isAndroid
                                            ? AlertDialog(
                                                title: Text("Peringatan"),
                                                content: Text(
                                                    "Anda yakin keluar dari aplikasi ini?"),
                                                actions: <Widget>[
                                                  FlatButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context),
                                                      child: Text("Tidak")),
                                                  FlatButton(
                                                      onPressed: () =>
                                                          signOut(),
                                                      child: Text("Ya")),
                                                ],
                                              )
                                            : CupertinoAlertDialog(
                                                title: Text("Peringatan"),
                                                content: Text(
                                                    "Anda yakin keluar dari aplikasi ini?"),
                                                actions: <Widget>[
                                                  FlatButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context),
                                                      child: Text("Tidak")),
                                                  FlatButton(
                                                      onPressed: () =>
                                                          signOut(),
                                                      child: Text("Ya")),
                                                ],
                                              );
                                      });
                                },
                                child: Icon(
                                  Icons.lock_open,
                                  color: Colors.white,
                                ))
                            : SizedBox()
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: login
                      ? Container(
                          height: MediaQuery.of(context).size.height,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                height: 230,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(100),
                                      bottomRight: Radius.circular(100),
                                    ),
                                    color: Colors.lightBlue),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Image.asset(
                                      "././assets/img/place.png",
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(16),
                                              bottomRight: Radius.circular(16),
                                            )),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "POSTINGAN",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: "fontFavoritBold",
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Expanded(
                                              child: cekData
                                                  ? StaggeredGridView
                                                      .countBuilder(
                                                      crossAxisCount: 9,
                                                      staggeredTileBuilder:
                                                          (int index) =>
                                                              new StaggeredTile
                                                                  .fit(3),
                                                      padding:
                                                          EdgeInsets.all(16),
                                                      mainAxisSpacing: 8,
                                                      crossAxisSpacing: 8,
                                                      itemCount: list.length,
                                                      shrinkWrap: true,
                                                      physics:
                                                          ClampingScrollPhysics(),
                                                      itemBuilder:
                                                          (context, i) {
                                                        final a = list[i];
                                                        return InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              login
                                                                  ? execute(a)
                                                                  : sessionSignOut();
                                                            });
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            FeedDetail(
                                                                              model: a,
                                                                              reload: getPref,
                                                                            )));
                                                          },
                                                          child: Container(
                                                            child: Column(
                                                              children: <
                                                                  Widget>[
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16),
                                                                  child: Image
                                                                      .network(
                                                                    "${ConstantsUtil.imgUrlFeed}/${a.photo}",
                                                                    fit: BoxFit
                                                                        .cover,
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
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Text(
                                                          "Anda belum memiliki posting",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                  right: 10,
                                  top: 10,
                                  left: 10,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              "$namaLengkap",
                                              style: TextStyle(
                                                fontSize: 26,
                                                color: Colors.white,
                                                fontFamily: "FontFavoritBold",
                                                shadows: [
                                                  Shadow(
                                                      color: Colors.blue[900],
                                                      blurRadius: 5,
                                                      offset: Offset(1, 1))
                                                ],
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: <Widget>[
                                                Text(
                                                  "$phone",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.lightBlue,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                    height: 20,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                      color: Colors.lightBlue,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Icon(
                                                      Icons.call,
                                                      color: Colors.white,
                                                      size: 10,
                                                    ))
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          pilihGambar();
                                        },
                                        child: Container(
                                          height: 90,
                                          width: 90,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 6,
                                                  color: Colors.white),
                                              shape: BoxShape.circle),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(3600),
                                            child: Image.network(
                                              "$photo",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        )
                      : Container(
                          child: Stack(
                            children: <Widget>[
                              Container(
                                height: 230,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(100),
                                      bottomRight: Radius.circular(100),
                                    ),
                                    color: Colors.lightBlue),
                              ),
                              Positioned(
                                top: 30,
                                left: 0,
                                right: 0,
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.symmetric(horizontal: 8),
                                    child: Stack(
                                      children: <Widget>[
                                        Image.asset(
                                            "././assets/img/uiLogin.png"),
                                        Positioned(
                                            top: 100,
                                            left: 10,
                                            right: 10,
                                            bottom: 20,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  "Silahkan Login\nMenggunakan Akun Google",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontFamily: "FontJudul"),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(4),
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white),
                                                  child: Image.asset(
                                                    "././assets/img/logoGoogle.png",
                                                    height: 80,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                InkWell(
                                                  onTap: loginGoogle,
                                                  child: ButtonSPOT(
                                                    title:
                                                        "Masuk Dengan Google",
                                                    fontSize: 20,
                                                  ),
                                                )
                                              ],
                                            ))
                                      ],
                                    )),
                              ),
                              Positioned(
                                  right: 10,
                                  top: 10,
                                  left: 100,
                                  child: Text(
                                    "Anda\nBelum Login",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.white,
                                      fontFamily: "FontFavoritBold",
                                      shadows: [
                                        Shadow(
                                            color: Colors.blue[900],
                                            blurRadius: 5,
                                            offset: Offset(1, 1))
                                      ],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ))
                            ],
                          ),
                        )),
            ],
          ),
        ),
      ),
    );
  }

  File file;

  final picker = ImagePicker();
  kamera() async {
    var image = await picker.getImage(
      source: ImageSource.camera,
      maxWidth: 500.0,
      maxHeight: 500.0,
    );
    setState(() {
      file = File(image.path);
      submit();
    });
  }

  gallery() async {
    var image = await picker.getImage(
      source: ImageSource.gallery,
      maxWidth: 500.0,
      maxHeight: 500.0,
    );
    setState(() {
      file = File(image.path);
      submit();
    });
  }

  submit() async {
    var stream = http.ByteStream(DelegatingStream.typed(file.openRead()));
    var length = await file.length();

    var url = Uri.parse(ConstantsUtil.gantiPhoto());

    var request = http.MultipartRequest("POST", url);

    var multiPartFile = new http.MultipartFile("image", stream, length,
        filename: path.basename(file.path));

    request.fields['idUsers'] = idUsers;
    request.fields['serverName'] = ConstantsUtil.imgUrlProfile;

    request.files.add(multiPartFile);

    var response = await request.send();
    print(response.statusCode);
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
      final data = jsonDecode(value);
      int hasil = data['value'];
      String message = data['message'];
      String photo = data['photo'];
      if (hasil == 1) {
        // Navigator.pop(context);
        setState(() async {
          SharedPreferences pref = await SharedPreferences.getInstance();
          getPref();
          pref.setString(Pref.photo, photo);
        });
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Information"),
                content: Text("Upload Success"),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    child: Text("Ok"),
                  )
                ],
              );
            });
      } else {
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Warning"),
                content: Text("$message"),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Ok"),
                  )
                ],
              );
            });
      }
    });

    if (response.statusCode > 2) {
      print('Image uploaded');
      // Navigator.pop(context);
    } else {
      print('Upload failed');
    }
  }

  pilihGambar() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            content: Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      kamera();
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Icon(
                          Icons.camera_alt,
                          size: 30,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Ambil Dari Kamera",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      gallery();
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Icon(
                          Icons.photo,
                          size: 30,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Ambil Dari Gallery",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          );
        });
  }
}
