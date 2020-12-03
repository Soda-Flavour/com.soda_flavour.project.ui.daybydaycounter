import 'package:day_by_day_counter/model/detail_item_data.model.dart';
import 'package:day_by_day_counter/util/tic_toc_helper.dart';
import 'package:intl/intl.dart';

class ItemParser {
  int perDaySec = 86400;

  static final ItemParser _instance = ItemParser._internal();
  factory ItemParser() => _instance;

  ItemParser._internal() {
    //초기화 코드
    print("ItemParser loaded...");
  }

  static DetailItemDataModel parseDBItemListData(
      List<Map<String, dynamic>> dataList) {
    DetailItemDataModel data = new DetailItemDataModel(
      totalCount: dataList.length,
      todayCount: 0,
      dayAvg: 0,
      weekAvg: 0,
      dayItem: [],
    );
    int todayCount = 0;
    int dayItemCountForAvg = 0;
    int dayCountForAvg = 0;

    final now = DateTime.now();

    String formattedTodayDate = DateFormat('yyyy.MM.dd').format(now);

    // final lastMidnightMs =
    //     (new DateTime(now.year, now.month, now.day)).millisecondsSinceEpoch;
    // final todayMidNightSecondTime = (lastMidnightMs / 1000).round();

    //데이터가 없다면 그냥 빈 데이터를 전달한다.
    if (data.totalCount == 0) {
      return data;
    }

    dataList.forEach((element) {
      var eleTimeData =
          TicTocHelper.secTimeToDate(int.parse(element["dateTime"]));

      String formattedDate = DateFormat('yyyy.MM.dd').format(eleTimeData);
      String formattedTime = DateFormat('a h:mm:s').format(eleTimeData);

      //시간 로우 준비
      DayTimeList timeRow = new DayTimeList(
        id: element["id"],
        time: formattedTime,
      );

      if (formattedDate == formattedTodayDate) {
        todayCount += 1;
      }

      //dayItem이 비어 있으면 값을 날짜 로우를 생성하기만 하면됨.
      if (data.dayItem.length == 0) {
        if (formattedDate != formattedTodayDate) {
          dayItemCountForAvg += 1;
          dayCountForAvg += 1;
        }

        DayItem _dayItem = new DayItem(
          date: formattedDate,
          dayCount: 1,
          dayTimeList: [timeRow],
        );

        data.dayItem.add(_dayItem);
      } else {
        DayItem lastDayItem = data.dayItem.last;

        if (lastDayItem.date == formattedDate) {
          //마지막을 가져와서 날이 같으면 아이템 처음에 추가
          dayItemCountForAvg += 1;
          lastDayItem.dayCount += 1;
          lastDayItem.dayTimeList.add(timeRow);
        } else {
          //마지막을 가져와서 날이 다르면 새로운 날을 생성하고 아이템 추가
          if (formattedDate != formattedTodayDate) {
            dayItemCountForAvg += 1;
            dayCountForAvg += 1;
          }
          DayItem _dayItem = new DayItem(
            dayCount: 1,
            date: formattedDate,
            dayTimeList: [timeRow],
          );

          data.dayItem.add(_dayItem);
        }
      }
    });

    data.todayCount = todayCount;
    if (dayCountForAvg != 0 && dayItemCountForAvg != 0) {
      data.dayAvg = (dayItemCountForAvg / dayCountForAvg).round();
    }
    return data;
  }
}
