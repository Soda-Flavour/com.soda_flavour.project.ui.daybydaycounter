import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class TotalComp extends StatelessWidget {
  final int totalCount;
  final int dayAvg;
  final int weekAvg;

  const TotalComp({Key key, this.totalCount, this.dayAvg, this.weekAvg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'detail_item_total_section_count_title',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ).tr(),
              Text(
                'detail_item_total_section_count_content',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ).tr(namedArgs: {'count': totalCount.toString()}),
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
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text('detail_item_total_section_day_avg_title').tr(),
                          Text('detail_item_total_section_day_avg_content')
                              .tr(namedArgs: {'count': dayAvg.toString()}),
                        ],
                      ),
                    ),
                  ],
                ),
                // Row(
                //   children: [
                //     Expanded(
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         mainAxisSize: MainAxisSize.max,
                //         children: [
                //           Text('주간평균 (월~일 기준)'),
                //           Text('$weekAvg회'),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
