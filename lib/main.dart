import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotegal/pages/pageAll.dart';
import 'package:spotegal/pages/pageHome.dart';
import 'package:spotegal/pages/pageMaps.dart';
import 'package:spotegal/pages/pageAccount.dart';
import 'package:spotegal/pages/pageSpot.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'custom/constPref.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(),
    ));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  String fcmToken;
  bool login = false;
  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      login = pref.getBool(Pref.login) ?? false;
    });
    generatedToken();
    print("Login Conditions : $login");
  }

  generatedToken() async {
    fcmToken = await _firebaseMessaging.getToken();
    print("FCMTOKEN : $fcmToken");
  }

  int page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  //Create All Pages
  final PageHome _listHome = PageHome();
  final PageMaps _listMaps = PageMaps();
  final PageAll _listAll = PageAll();
  final PageSetting _listSetting = PageSetting();
  final PageUser _listUser = PageUser();

  Widget _showPage = PageHome();

  _pageChooser(int page) {
    switch (page) {
      case 0:
        return _listHome;
        break;
      case 1:
        return _listMaps;
        break;
      case 2:
        return _listAll;
        break;
      case 3:
        return _listUser;
        break;
      case 4:
        return _listSetting;
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.home, size: 30, color: Colors.white),
            Icon(Icons.map, size: 30, color: Colors.white),
            Icon(Icons.near_me, size: 30, color: Colors.white),
            Icon(Icons.photo_camera, size: 30, color: Colors.white),
            Icon(Icons.settings, size: 30, color: Colors.white),
          ],
          color: Colors.lightBlue,
          buttonBackgroundColor: Colors.lightBlue,
          backgroundColor: Colors.blue[100],
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (int tappedIndex) {
            setState(() {
              _showPage = _pageChooser(tappedIndex);
            });
          },
        ),
        body: Container(
          color: Colors.blue[100],
          child: Center(
            child: _showPage,
          ),
        ));
  }
}
