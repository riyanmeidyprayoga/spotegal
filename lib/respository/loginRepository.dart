import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotegal/custom/constPref.dart';
import 'package:spotegal/pages/auth/registrasi.dart';
import 'package:spotegal/utils/constans_util.dart';

import '../main.dart';

class LoginRespository {
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  Future handleSignIn(BuildContext context) async {
    final GoogleSignInAccount googleUsers = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUsers.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );
    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    if (user != null) {
      print(user.providerData[1].email);
      print(user.providerData[1].displayName);
      print(user.providerData[1].photoUrl);
      Platform.isAndroid
          ? cekEmail(
              user.providerData[1].email,
              user.providerData[1].photoUrl,
              context,
            )
          : cekEmail(
              user.email,
              user.photoUrl,
              context,
            );
    }
  }

  savePref(
    String id,
    String namaLengkap,
    String phone,
    String photo,
    String email,
    String createdDate,
    bool login,
  ) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(Pref.id, id);
    pref.setString(Pref.namaLengkap, namaLengkap);
    pref.setString(Pref.phone, phone);
    pref.setString(Pref.photo, photo);
    pref.setString(Pref.email, email);
    pref.setString(Pref.createdDate, createdDate);
    pref.setBool(Pref.login, login);
  }

  cekEmail(String email, String photoUrl, BuildContext context) async {
    final response =
        await http.post(ConstantsUtil.cekEmail(), body: {"email": email});
    final data = jsonDecode(response.body);
    int value = data['value'];
    String id = data['id'];
    String namaLengkap = data['namaLengkap'];
    String phone = data['phone'];
    String photo = data['photo'];
    String emails = data['email'];
    String createdDate = data['createdDate'];
    if (value == 1) {
      savePref(id, namaLengkap, phone, photo, emails, createdDate, true);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BottomNavBar()));
    } else {
      Route route =
          MaterialPageRoute(builder: (context) => Registrasi(email, photoUrl));
      Navigator.push(context, route);
    }
  }
}
