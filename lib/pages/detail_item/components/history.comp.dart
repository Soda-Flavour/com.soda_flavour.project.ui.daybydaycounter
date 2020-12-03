import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:day_by_day_counter/model/detail_item_data.model.dart';
import 'package:day_by_day_counter/pages/detail_item/components/history_day.comp.dart';
import 'package:get/get.dart';

class HistoryComp extends StatelessWidget {
  final List<DayItem> historyData;

  const HistoryComp({Key key, this.historyData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var dayItem in historyData) HistoryDayComp(dayItem: dayItem)
        ],
      ),
    );
  }
}
