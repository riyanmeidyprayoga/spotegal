import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotegal/custom/constPref.dart';
import 'package:spotegal/utils/constans_util.dart';

import '../main.dart';

class RegistrasiRepository {
  Future simpan(
    BuildContext context,
    String email,
    String photoUrl,
    String phone,
    String namaLengkap,
  ) async {
    final response = await http.post(ConstantsUtil.daftar(), body: {
      "email": email,
      "photoUrl": photoUrl,
      "phone": phone,
      "namaLengkap": namaLengkap,
    });
    final data = jsonDecode(response.body);
    int value = data['value'];
    String id = data['id'];
    String nama = data['namaLengkap'];
    String hp = data['phone'];
    String photo = data['photo'];
    String emails = data['email'];
    String createdDate = data['createdDate'];
    if (value == 1) {
      savePref(id, nama, hp, photo, emails, createdDate, true);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BottomNavBar()));
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
}
