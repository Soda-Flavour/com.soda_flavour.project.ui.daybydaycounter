import 'package:flutter/material.dart';
import 'package:day_by_day_counter/database/DBHelper.dart';
import 'package:day_by_day_counter/model/main_item.model.dart';
import 'package:day_by_day_counter/model/title_item.model.dart';
import 'package:get/get.dart';

class MainTitleItemCtrl extends GetxController {
  List<MainItem> titleItemListData = List<MainItem>().obs;
  @override
  void onInit() {
    apiGetTitleList();
    super.onInit();
  }

  void apiGetTitleList() {
    Future.delayed(
        Duration.zero,
        () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false));

    titleItemListData.clear();

    DBHelper.db.getTitleItemList().then((value) async {
      for (final element in value) {
        // await Future.delayed(Duration(seconds: 2), () => print(""));
        print(element['id']);
        titleItemListData.add(MainItem(
            id: element['id'], title: element['title'], cnt: element['cnt']));
      }
      titleItemListData.insert(0, MainItem(id: null, title: null, cnt: 0));

      Get.back();
    });
  }

  void addTitleData(TitleItem titleItem) async {
    int resultId = await DBHelper.db.insertTitleItem(titleItem);
  }
}
