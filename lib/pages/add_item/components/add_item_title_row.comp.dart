import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class AddItemTitleRowComp extends StatelessWidget {
  final TextEditingController titleCnt;

  const AddItemTitleRowComp({Key key, this.titleCnt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'add_item_sub_title',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
              ),
            ).tr(),
            SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      controller: titleCnt,
                      textAlign: TextAlign.end,
                      decoration: new InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 8.0),
                        hintText: tr('add_item_input_hint'),
                        isDense: true,
                        border: new UnderlineInputBorder(
                          borderSide: new BorderSide(
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
