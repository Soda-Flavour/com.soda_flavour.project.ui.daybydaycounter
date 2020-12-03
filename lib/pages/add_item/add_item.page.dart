import 'package:flutter/material.dart';
import 'package:day_by_day_counter/controller/main_title_item.ctrl.dart';
import 'package:day_by_day_counter/database/DBHelper.dart';
import 'package:day_by_day_counter/model/title_item.model.dart';
import 'package:day_by_day_counter/pages/common_componets/app_bar_default.comp.dart';

import 'package:get/get.dart';

import 'components/add_item_title_row.comp.dart';

import 'package:easy_localization/easy_localization.dart';

class AddItemPage extends StatelessWidget {
  final titleController = TextEditingController();
  TitleItem titleItem;
  final MainTitleItemCtrl _mainTitleItemCtrl = Get.put(MainTitleItemCtrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Container(
          alignment: FractionalOffset.centerRight,
          child: AppBar(
            automaticallyImplyLeading: true, //왼쪽 화살표 뒤로 없애기
            leading: BackButton(
              color: Colors.black,
            ),
            backgroundColor: const Color(0xffffffff),
            title: Text(
              'add_item_title',
              style: TextStyle(
                letterSpacing: 0.07,
                color: Colors.black,
                fontSize: 20.0,
              ),
            ).tr(),
            centerTitle: true,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          alignment: Alignment.topCenter,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 632,
            ),
            child: CustomScrollView(
              key: PageStorageKey<String>("order_product"),
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate.fixed([
                    SizedBox(
                      height: 60,
                      child: Container(),
                    ),

                    AddItemTitleRowComp(titleCnt: titleController),
                    // SizedBox(
                    //   height: 5,
                    //   child: Container(
                    //     color: Colors.grey[300],
                    //   ),
                    // ),
                    // RaisedButton(
                    //   child: Text('디비삭제', style: TextStyle(fontSize: 24)),
                    //   color: Colors.blueAccent,
                    //   onPressed: () async {
                    //     await DBHelper.db.deleteTitleItemAll();
                    //     print(DBHelper.db.getTitleItemList());
                    //   },
                    //   textColor: Colors.white,
                    // ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: SafeArea(
          child: Container(
              height: 70,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 8.0,
                ),
                child: Container(
                  child: RaisedButton(
                    child:
                        Text('add_item_add_btn', style: TextStyle(fontSize: 24))
                            .tr(),
                    color: const Color(0xffffbe53),
                    onPressed: () async {
                      print(titleController.text);
                      if (titleController.text == "") {
                        if (Get.isSnackbarOpen) {
                          Get.back();
                        }

                        Get.snackbar(
                          tr('add_item_cautions_title'),
                          tr('add_item_cautions_content'),
                          snackPosition: SnackPosition.TOP,
                        );
                      } else {
                        var ms = (new DateTime.now()).millisecondsSinceEpoch;
                        var secondTime = (ms / 1000).round();

                        await _mainTitleItemCtrl.addTitleData(
                          TitleItem(
                            title: titleController.text,
                            dateTime: secondTime.toString(),
                          ),
                        );

                        print(DBHelper.db.getTitleItemList());
                        Get.back();
                      }
                    },
                    textColor: Colors.white,
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
