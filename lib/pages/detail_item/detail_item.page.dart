import 'package:flutter/material.dart';
import 'package:day_by_day_counter/controller/detail_item.ctrl.dart';
import 'package:day_by_day_counter/database/DBHelper.dart';
import 'package:get/get.dart';

import 'components/history.comp.dart';
import 'components/top_section.comp.dart';

import 'components/total.comp.dart';
import 'package:easy_localization/easy_localization.dart';

class DetailItemPage extends StatelessWidget {
  final DetailItemCtrl _detailItemCtrl = Get.put(DetailItemCtrl());

  @override
  Widget build(BuildContext context) {
    String detailItemTitle = Get.arguments[0];
    int detailitemId = Get.arguments[1];
    _detailItemCtrl.getItemData(detailItemTitle, detailitemId);
    return Scaffold(
      backgroundColor: Colors.white,
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
              'detail_item_title',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                letterSpacing: 0.07,
                color: Colors.black,
                fontSize: 20.0,
              ),
            ).tr(),
            centerTitle: true,
            actions: [
              new IconButton(
                icon: new Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
                tooltip: 'more',
                onPressed: () => {
                  Get.bottomSheet(Container(
                    height: 80,
                    color: Colors.white,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.delete),
                          title: Text("detail_item_delete_title").tr(),
                          onTap: () async {
                            Get.back(); //remove snackbar
                            Get.defaultDialog(
                              title: tr("detail_item_delete_title"),
                              middleText: tr("detail_item_delete_content"),
                              cancel: FlatButton(
                                onPressed: () async {
                                  await _detailItemCtrl
                                      .deleteTitleData(detailitemId);

                                  Get.back();
                                  Get.back();
                                  Get.snackbar(
                                    tr('detail_item_delete_comp_title'),
                                    tr('detail_item_delete_comp_content'),
                                    snackPosition: SnackPosition.TOP,
                                  );
                                },
                                child: Text("detail_item_delete_yes").tr(),
                              ),
                              confirm: FlatButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text("detail_item_delete_no").tr(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  )),
                },
              ),
            ],
          ),
        ),
      ),
      body: Obx(
        () => SafeArea(
          child: Container(
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
                      // OrderProductMainAdComp(),
                      SizedBox(
                        height: 8,
                        child: Container(
                          color: Colors.grey[300],
                        ),
                      ),
                      TopSectionComp(
                          itemTitle: _detailItemCtrl.itemTitle,
                          dayCount:
                              _detailItemCtrl.detailPageItemData.todayCount,
                          onBtnTapped: () {
                            _detailItemCtrl.incrementDayCount(detailitemId);
                          }),
                      SizedBox(
                        height: 10,
                        child: Container(
                          color: Colors.grey[300],
                        ),
                      ),
                      TotalComp(
                        totalCount:
                            _detailItemCtrl.detailPageItemData.totalCount,
                        dayAvg: _detailItemCtrl.detailPageItemData.dayAvg,
                        weekAvg: _detailItemCtrl.detailPageItemData.weekAvg,
                      ),
                      SizedBox(
                        height: 15,
                        child: Container(
                          color: Colors.grey[300],
                        ),
                      ),
                      HistoryComp(
                          historyData:
                              _detailItemCtrl.detailPageItemData.dayItem),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
