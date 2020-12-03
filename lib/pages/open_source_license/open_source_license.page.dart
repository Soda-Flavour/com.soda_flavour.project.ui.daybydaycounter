import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OpenSourceLicensePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Container(
          alignment: FractionalOffset.centerRight,
          child: AppBar(
            automaticallyImplyLeading: true, //왼쪽 화살표 뒤로 없애기
            leading: BackButton(
              color: Colors.black,
            ),
            backgroundColor: const Color(0xffffffff),
            title: Text(
              'Open Source License',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                letterSpacing: 0.07,
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
            centerTitle: true,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 632,
            ),
            child: WebView(
              initialUrl:
                  'https://water-flavour.com/web/daybyday_counter/open_source_license',
            ),
          ),
        ),
      ),
    );
  }
}
