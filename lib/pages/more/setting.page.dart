import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:day_by_day_counter/pages/common_componets/app_bar_default.comp.dart';
import 'package:day_by_day_counter/pages/common_componets/list_item_title_with_arrow.comp.dart';
import 'package:day_by_day_counter/pages/common_componets/list_item_title_with_switch.comp.dart';
import 'package:day_by_day_counter/pages/open_source_license/open_source_license.page.dart';
import 'package:get/get.dart';
import 'package:get_version/get_version.dart';
import 'package:easy_localization/easy_localization.dart';

class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Container(
          alignment: FractionalOffset.centerRight,
          child: AppBar(
            automaticallyImplyLeading: false, //왼쪽 화살표 뒤로 없애기
            leading: BackButton(
              color: Colors.black,
            ),
            backgroundColor: const Color(0xffffffff),
            title: Text(
              'setting_title',
              style: TextStyle(color: Colors.black),
            ).tr(),
            centerTitle: true,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            constraints: BoxConstraints(
              maxWidth: 632,
            ),
            child: CustomScrollView(
              key: PageStorageKey<String>("more"),
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate.fixed(
                    [
                      // ListItemTitleWithSwitchComp(
                      //   text: "상담 메시지 알림",
                      // ),
                      // ListItemTitleWithSwitchComp(
                      //   text: "푸쉬 알림 수신동의",
                      // ),
                      // ListItemTitleWithSwitchComp(
                      //   text: "이메일 수신동의",
                      // ),
                      ListItemTitleWithArrowComp(
                        text: tr('setting_row_cautions_title'),
                        onTap: () async {
                          Get.defaultDialog(
                              title: "Cautions",
                              titleStyle: TextStyle(
                                color: Colors.red,
                              ),
                              middleText: tr('setting_row_cautions_content'),
                              middleTextStyle: TextStyle());
                        },
                      ),
                      Divider(
                        height: 20,
                      ),
                      ListItemTitleWithArrowComp(
                        text: tr('setting_row_version_title'),
                        onTap: () async {
                          String projectVersion;
                          // Platform messages may fail, so we use a try/catch PlatformException.
                          try {
                            projectVersion = await GetVersion.projectVersion;
                            print(projectVersion);
                          } on PlatformException {
                            projectVersion = 'Failed to get project version.';
                          }

                          Get.defaultDialog(
                              title: "Version", middleText: projectVersion);
                        },
                      ),
                      Divider(
                        height: 20,
                      ),
                      ListItemTitleWithArrowComp(
                        text: "OpenSource License",
                        onTap: () async {
                          Get.to(OpenSourceLicensePage());
                        },
                      ),
                      Divider(
                        thickness: 1.0,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
