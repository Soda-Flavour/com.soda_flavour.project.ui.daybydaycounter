import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:day_by_day_counter/model/detail_item_data.model.dart';

import 'history_time.comp.dart';
import 'package:easy_localization/easy_localization.dart';

class HistoryDayComp extends StatelessWidget {
  final DayItem dayItem;

  const HistoryDayComp({Key key, this.dayItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              dayItem.date,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'detail_item_count_unit',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ).tr(namedArgs: {'count': dayItem.dayCount.toString()}),
          ],
        ),
        Divider(
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              for (var dayTime in dayItem.dayTimeList)
                HistoryTimeComp(time: dayTime.time)
            ],
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: DottedLine(),
        )
      ],
    );
  }
}
