import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class HistoryTimeComp extends StatelessWidget {
  final String time;

  const HistoryTimeComp({Key key, this.time}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('detail_item_add_time').tr(),
              Text('$time'),
            ],
          ),
        ),
        // Icon(Icons.more_vert)
      ],
    );
  }
}
