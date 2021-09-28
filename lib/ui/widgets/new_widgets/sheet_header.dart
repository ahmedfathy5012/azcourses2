import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';

import '../customText.dart';

class SheetHeader extends StatelessWidget {
  final String title;


  SheetHeader({this.title=' '});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
          horizontal: ScreenHelper.screenWidth(context,16)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CloseButton(),
          CustomText(
            text: title,
            color: MAINBlack2,
            fontW: FW.semibold,
            fontSize: 18,
          ),
          SizedBox(width: 10,)
        ],
      ),
    );
  }
}
