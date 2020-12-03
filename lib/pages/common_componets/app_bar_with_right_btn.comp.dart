import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AppBarWithRightBtnComp extends StatelessWidget {
  final String title;
  final Widget rightBtn;

  const AppBarWithRightBtnComp({Key key, this.title, this.rightBtn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              // Icon(
              //   Icons.keyboard_arrow_right,
              //   color: Colors.black.withOpacity(0.4),
              // ),
            ],
          ),
          rightBtn,
        ],
      ),
    );
  }
}
