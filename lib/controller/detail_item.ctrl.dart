import 'package:flutter/material.dart';
import 'package:day_by_day_counter/database/DBHelper.dart';
import 'package:day_by_day_counter/model/detail_item_data.model.dart';
import 'package:day_by_day_counter/model/main_item.model.dart';
import 'package:day_by_day_counter/model/title_item.model.dart';
import 'package:day_by_day_counter/util/item_parser.dart';
import 'package:get/get.dart';

class DetailItemCtrl extends GetxController {
  final _itemTitle = "".obs;

  String get itemTitle => this._itemTitle.value;
  set itemTitle(String value) => this._itemTitle.value = value;

  final _detailPageItemData =
      new DetailItemDataModel(totalCount: 0, dayItem: []).obs;

  DetailItemDataModel get detailPageItemData => this._detailPageItemData.value;
  set detailPageItemData(DetailItemDataModel value) =>
      this._detailPageItemData.value = value;

  @override
  void onInit() {
    // apiGetTitleList();
    super.onInit();
  }

  void getItemData(String title, int titleId) {
    // Future.delayed(
    //     Duration.zero,
    //     () => Get.dialog(Center(child: CircularProgressIndicator()),
    //         barrierDismissible: false));

    print("12121212121121");
    // print(titleId);
    print(title);
    print("12121212121121");
    DBHelper.db.getItemDayData(titleId).then((resultDB) async {
      itemTitle = title;
      detailPageItemData = await ItemParser.parseDBItemListData(resultDB);
      print('---------');
      print(detailPageItemData.totalCount);
      // for (final element in value) {
      //   // await Future.delayed(Duration(seconds: 2), () => print(""));
      //   print(element['id']);
      //   titleItemListData.add(MainItem(
      //       id: element['id'], title: element['title'], cnt: element['cnt']));
      // }

      // Get.back();
    });

    // List<Map<String, dynamic>> resultDB = await DBHelper.db.getItemDayData(titleId);

    // Get.back();
  }

  void incrementDayCount(int titleId) async {
    int resultId = await DBHelper.db.increaseDayCnt(titleId);
    await getItemData(itemTitle, titleId);
    print('결과 : $resultId');
  }

  void deleteTitleData(int titleId) async {
    Future.delayed(
        Duration.zero,
        () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false));
    await DBHelper.db.deleteTitleItem(titleId);
    Get.back();
    // int resultId = await DBHelper.db.increaseDayCnt(titleId);
    // await getItemData(itemTitle, titleId);
    // print('결과 : $resultId');
  }
}
