import 'dart:io';

import 'package:flutter/material.dart';
import 'package:day_by_day_counter/controller/main_title_item.ctrl.dart';
import 'package:day_by_day_counter/pages/add_item/add_item.page.dart';
import 'package:day_by_day_counter/pages/detail_item/detail_item.page.dart';
import 'package:day_by_day_counter/pages/more/setting.page.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:admob_flutter/admob_flutter.dart';

class MyListPage extends StatefulWidget {
  const MyListPage({Key key}) : super(key: key);

  @override
  _MyListPageState createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> with TickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollController;

  final MainTitleItemCtrl _mainTitleItemCtrl = Get.put(MainTitleItemCtrl());

  final infoKey = new GlobalKey();
  final accountKey = new GlobalKey();
  final loanKey = new GlobalKey();
  // final serviceKey = new GlobalKey();
  // final allianceKey = new GlobalKey();

  double adHeight = 0;
  double accountHeight = 0;
  double loanHeight = 0;
  // double serviceHeight = 0;
  // double allianceHeight = 0;
  bool isTabToScroll = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              'add_item_title',
              style: TextStyle(
                fontWeight: FontWeight.w700,
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
          constraints: BoxConstraints(
            maxWidth: 632,
          ),
          child: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  titleSpacing: 10,
                  title: Text(
                    'my_list_title',
                    style: TextStyle(color: Colors.black),
                  ).tr(),
                  backgroundColor: Colors.white,
                  automaticallyImplyLeading: false,
                  elevation: 0.0,
                  pinned: true,
                  leading: IconButton(
                    icon: Icon(
                      Icons.add,
                      size: 22.0,
                      color: Colors.black,
                    ),
                    onPressed: () async {
                      await Get.to(AddItemPage());
                      _mainTitleItemCtrl.apiGetTitleList();
                    },
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.settings,
                        color: Colors.black,
                      ),
                      onPressed: () async {
                        await Get.to(MorePage());
                        _mainTitleItemCtrl.apiGetTitleList();
                      },
                    )
                  ],
                ),
                // SliverToBoxAdapter(
                //   child: MyListMainInfoComp(),
                // ),
                SliverToBoxAdapter(
                  child: Divider(
                    thickness: 1.0,
                  ),
                ),
                // SliverAppBar(
                //   titleSpacing: 0,
                //   title: MyListTabBarComp(
                //     tabController: _tabController,
                //     // onTap: _onTabToScroll,
                //   ),
                //   backgroundColor: Colors.white,
                //   automaticallyImplyLeading: false,
                //   elevation: 0.0,
                //   pinned: true,
                // ),
              ];
            },
            body: Obx(
              () => (_mainTitleItemCtrl.titleItemListData.length == 0)
                  ? Column(
                      children: [
                        Center(
                          child: const Text(
                            'my_list_empty',
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.grey,
                            ),
                          ).tr(),
                        ),
                      ],
                    )
                  : ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        if (_mainTitleItemCtrl.titleItemListData[index].title ==
                            null) {
                          return SizedBox(
                            height: 90,
                            child: AdmobBanner(
                              adUnitId: Platform.isIOS
                                  ? 'ca-app-pub-3940256099942544/2934735716'
                                  : 'ca-app-pub-5995540309343555~7498720061',
                              adSize: AdmobBannerSize.BANNER,
                              listener: (AdmobAdEvent event,
                                  Map<String, dynamic> args) {
                                print('ㅊㅁㅊㅁㅊㅁ:$event');
                              },
                            ),
                          );
                        } else {
                          return Container(
                            height: 120,
                            color: Colors
                                .primaries[index % Colors.primaries.length],
                            alignment: Alignment.center,
                            child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () async {
                                await Get.to(DetailItemPage(), arguments: [
                                  _mainTitleItemCtrl
                                      .titleItemListData[index].title,
                                  _mainTitleItemCtrl
                                      .titleItemListData[index].id,
                                ]);

                                await _mainTitleItemCtrl.apiGetTitleList();
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _mainTitleItemCtrl
                                                .titleItemListData[index].title,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2.0,
                                          ),
                                          Text(
                                            'my_list_row_title',
                                            // '오늘의 횟수 : ${_mainTitleItemCtrl.titleItemListData[index].cnt}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 35,
                                            ),
                                          ).tr(namedArgs: {
                                            'count': _mainTitleItemCtrl
                                                .titleItemListData[index].cnt
                                                .toString()
                                          }),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 50.0,
                                    child: Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Colors.white,
                                      size: 30.0,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                      },
                      itemCount: _mainTitleItemCtrl.titleItemListData.length,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
