import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class TopSectionComp extends StatelessWidget {
  final String itemTitle;
  final int dayCount;
  final Function onBtnTapped;

  const TopSectionComp(
      {Key key, this.dayCount, this.onBtnTapped, this.itemTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: Colors.grey,
      ),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: 10,
        ),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  '$itemTitle',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
            Divider(
              thickness: 1,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'detail_item_sub_title',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 22.0,
                  ),
                ).tr(),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  '$dayCount',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 45.0,
                  ),
                ),
                SizedBox(
                  height: 32.0,
                ),
                SizedBox(
                  width: Get.size.width * 0.7,
                  height: 65,
                  child: FlatButton(
                      onPressed: onBtnTapped,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      color: Colors.blueGrey,
                      child: Text(
                        "+1",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      )),
                ),
                SizedBox(
                  height: 32.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
