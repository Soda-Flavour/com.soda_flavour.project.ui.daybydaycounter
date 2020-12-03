import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:day_by_day_counter/pages/my_list/my_list.page.dart';

class SplashScreen extends StatefulWidget {
  int splashTime;
  SplashScreen(this.splashTime);
  @override
  _SplashScreenState createState() =>
      _SplashScreenState(splashTime: splashTime);
}

/// Component UI
class _SplashScreenState extends State<SplashScreen> {
  int splashTime;
  _SplashScreenState({Key key, this.splashTime});

  /// To navigate layout change
  void NavigatorPage() async {
    Widget page;
    page = MyListPage();

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => page),
        (Route<dynamic> route) => false);
  }

  /// Declare startTime to InitState
  @override
  void initState() {
    super.initState();
    (() async {
      await new Timer(Duration(milliseconds: splashTime), NavigatorPage);
    })();
  }

  /// Code Create UI Splash Screen
  Widget build(BuildContext context) {
    var assetsImage = new AssetImage('assets/images/daybyday_splash.png');
    var image = new Image(
      image: assetsImage,
      width: MediaQuery.of(context).size.width / 2,
    );

    return Scaffold(
      backgroundColor: const Color(0xffffbe53),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: image,
            ),
            Text(
              'Day By Day Counter',
              style: TextStyle(
                fontSize: 20.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
