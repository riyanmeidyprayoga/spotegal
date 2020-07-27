import 'package:flutter/material.dart';
import 'package:spotegal/custom/buttonCustom.dart';
import 'package:spotegal/respository/registrasiRepository.dart';

class Registrasi extends StatefulWidget {
  final String email;
  final String photoUrl;
  Registrasi(this.email, this.photoUrl);
  @override
  _RegistrasiState createState() => _RegistrasiState();
}

class _RegistrasiState extends State<Registrasi> {
  RegistrasiRepository registrasiRepository = RegistrasiRepository();
  TextEditingController namaLengkap = TextEditingController();
  TextEditingController nomorPonsel = TextEditingController();
  final _key = GlobalKey<FormState>();
  cek() async {
    if (_key.currentState.validate()) {
      await registrasiRepository.simpan(
        context,
        widget.email,
        widget.photoUrl,
        nomorPonsel.text,
        namaLengkap.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(),
                child: Container(
                  color: Colors.lightBlue,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 5, right: 5, top: 5, bottom: 5),
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
                child: Container(
                  color: Colors.blue[100],
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
                      Positioned(
                        top: 30,
                        left: 0,
                        right: 0,
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            child: Stack(
                              children: <Widget>[
                                Image.asset("././assets/img/uiLogin.png"),
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
                                        Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              border: Border.all(
                                                width: 1,
                                                color: Colors.blue[100],
                                              ),
                                              color: Colors.white),
                                          child: TextFormField(
                                            controller: namaLengkap,
                                            validator: (e) {
                                              if (e.length < 3)
                                                return "Nama Lengkap minimal 3 Karakter";
                                              else
                                                null;
                                            },
                                            decoration: InputDecoration(
                                              hintText: "Nama Lengkap",
                                              fillColor: Colors.white,
                                              filled: true,
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none),
                                              disabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            border: Border.all(
                                              width: 1,
                                              color: Colors.blue[100],
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                hintText: "Nomor Ponsel",
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide
                                                            .none),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none),
                                                disabledBorder:
                                                    UnderlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none)),
                                            keyboardType: TextInputType.number,
                                            controller: nomorPonsel,
                                            validator: (e) {
                                              if (e.length < 10)
                                                return "Nama Lengkap minimal 10 Karakter";
                                              else
                                                null;
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        InkWell(
                                          onTap: cek,
                                          child: ButtonSPOT(
                                            title: "Daftar",
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
                            "Lengkapi\nProfil Anda",
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
