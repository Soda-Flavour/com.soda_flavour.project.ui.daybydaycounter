import 'dart:convert';
import 'dart:io';
import 'package:day_by_day_counter/model/title_item.model.dart';
import 'package:day_by_day_counter/util/item_parser.dart';
import 'package:day_by_day_counter/util/tic_toc_helper.dart';
import 'package:intl/intl.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String tableName = 'daybyday';

class DBHelper {
  DBHelper._();
  static final DBHelper db = DBHelper._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    final path = join(await getDatabasesPath(), 'dayByDayDb.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE daybyday_title(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, dateTime TEXT)",
        );

        await db.execute(
          "CREATE TABLE daybyday_item(id INTEGER PRIMARY KEY AUTOINCREMENT, title_id int, dateTime TEXT)",
        );
      },
    );
  }

  //항목추가
  Future<int> insertTitleItem(TitleItem titleitem) async {
    Database database = await this.database;
    var result = await database.insert('daybyday_title', titleitem.toJson());
    return result;
  }

  //항목삭제
  Future<int> deleteTitleItem(int titleId) async {
    Database database = await this.database;
    int resultDeleteCnt = await database
        .rawDelete('DELETE FROM daybyday_title WHERE id = ?', [titleId]);
    int _resultDeleteCnt = await database
        .rawDelete('DELETE FROM daybyday_item WHERE title_id = ?', [titleId]);
    return resultDeleteCnt;
  }

  //단일 항목 횟수 증가
  Future<int> increaseDayCnt(int titleId) async {
    Database database = await this.database;
    var ms = (new DateTime.now()).millisecondsSinceEpoch;
    var secondTime = (ms / 1000).round().toString();

    var result = await database.rawInsert(
        'INSERT INTO daybyday_item(title_id, dateTime) VALUES(?, ?)',
        [titleId, secondTime]);
    return result;
  }

  //단일 항목 횟수 감소
  Future<int> decreaseDayCnt(int dayItemId) async {
    Database database = await this.database;
    int resultDeleteCnt = await database
        .rawDelete('DELETE FROM daybyday_item WHERE id = ?', [dayItemId]);
    return resultDeleteCnt;
  }

//항목 리스트 => 제목과 당일 데이터의 수 불러오기
  Future<List<Map<String, dynamic>>> getTitleItemList() async {
    final databae = await this.database;

    final toDaySec = TicTocHelper.todayMidNightSec();

    final List<Map<String, dynamic>> res = await databae.rawQuery(
        "SELECT dt.id, dt.title, COUNT(di.id) AS cnt FROM daybyday_title AS dt LEFT JOIN daybyday_item AS di ON di.title_id = dt.id AND di.dateTime >= ?  GROUP BY dt.id ORDER BY dt.id DESC",
        [toDaySec]);

    return res;
    // return List.generate(
    //     maps.length, (index) => TitleItem.fromJson(maps[index]));
  }

  //항목 단일 정보 => 단일 항목의 데이터
  Future<List<Map<String, dynamic>>> getItemDayData(int titleId) async {
    final databae = await this.database;

    // final List<Map<String, dynamic>> res = await databae.rawQuery(
    //     "SELECT COUNT(id) AS cnt FROM daybyday_item WHERE title_id = ? ",
    //     [titleId]);
    final List<Map<String, dynamic>> res = await databae.rawQuery(
        "SELECT * FROM daybyday_item WHERE title_id = ? ORDER BY id DESC",
        [titleId]);

    print("-----------");

    res.forEach((element) {
      print(TicTocHelper.secTimeToDate(int.parse(element["dateTime"])));
    });

    print("-----------");
    // ItemParser.parseDBItemListData(res);

    return res;
  }

  //디비 클리어
  deleteTitleItemAll() async {
    final db = await database;
    db.rawDelete('DELETE FROM daybyday_title');
  }
}
