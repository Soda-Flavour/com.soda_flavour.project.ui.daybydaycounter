import 'package:flutter/material.dart';

class AppBarDefaultComp extends StatelessWidget {
  final String title;

  const AppBarDefaultComp({Key key, this.title}) : super(key: key);
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
        ],
      ),
    );
  }
}
