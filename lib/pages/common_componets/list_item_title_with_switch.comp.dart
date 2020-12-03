import 'package:flutter/material.dart';

class ListItemTitleWithSwitchComp extends StatelessWidget {
  final String text;

  const ListItemTitleWithSwitchComp({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Switch(
            value: false,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
