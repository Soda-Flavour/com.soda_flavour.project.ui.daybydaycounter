import 'package:flutter/material.dart';

class OrderProductCheckTextRowComp extends StatelessWidget {
  final String content;

  const OrderProductCheckTextRowComp({Key key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Icon(
            Icons.check,
            size: 14.0,
          ),
        ),
        SizedBox(
          width: 5.0,
        ),
        Expanded(
          child: Text(
            content,
            style: TextStyle(
              color: Colors.black,
              height: 1.5,
            ),
          ),
        )
      ],
    );
  }
}
