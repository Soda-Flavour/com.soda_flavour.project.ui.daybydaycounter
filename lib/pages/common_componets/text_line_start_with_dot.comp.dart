import 'package:flutter/material.dart';

class TextLineStartWithDotComp extends StatelessWidget {
  final double iconPaddingTop;
  final Color iconColor;
  final double iconSize;
  final String content;
  final Color color;
  final double fontSize;

  const TextLineStartWithDotComp(
      {Key key,
      this.iconPaddingTop = 0.0,
      this.iconColor,
      this.iconSize,
      this.content,
      this.color,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: iconPaddingTop,
            ),
            child: Icon(
              Icons.circle,
              color: iconColor,
              size: iconSize,
            ),
          ),
          SizedBox(
            width: 5.0,
          ),
          Expanded(
            child: Text(
              content,
              style: TextStyle(
                fontSize: fontSize,
                color: color,
                height: 1.5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
