import 'package:intl/intl.dart';

class TicTocHelper {
  int perDaySec = 86400;

  static final TicTocHelper _instance = TicTocHelper._internal();
  factory TicTocHelper() => _instance;

  TicTocHelper._internal() {
    //초기화 코드
    print("TicTocHelper loaded...");
  }

  static int todayMidNightSec() {
    final now = DateTime.now();
    final lastMidnightMs =
        (new DateTime(now.year, now.month, now.day)).millisecondsSinceEpoch;
    final todayMidNightSecondTime = (lastMidnightMs / 1000).round();
    return todayMidNightSecondTime;
  }

  static DateTime secTimeToDate(int secTime) {
    return DateTime.fromMillisecondsSinceEpoch(secTime * 1000);
  }
}
