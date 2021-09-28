import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';

import 'icon_circular.dart';

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenHelper.screenWidth(context,343),
      height: ScreenHelper.screenHeight(context,99),
      decoration: BoxDecoration(
        color: Color(0xffF7F7F7),
        borderRadius: BorderRadius.circular(ScreenHelper.screenRadius(context,15))
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: ScreenHelper.screenWidth(context,16)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: ScreenHelper.screenHeight(context,65),
              width: ScreenHelper.screenHeight(context,65),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(65),
                color: MAINCOLOR
              ),
            ),
            SizedBox(width: ScreenHelper.screenWidth(context,10),),
            Container(width: ScreenHelper.screenWidth(context, 170),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // width: ScreenHelper.screenWidth(context, 180),
                    color: Colors.transparent,
                    child: CustomText(
                      text: 'مهند طارق',
                      fontW: FW.semibold,
                      fontSize: 16,
                      overflow: true,
                      color: DARKBLACKCOLOR,
                    ),
                  ),
                  SizedBox(height: ScreenHelper.screenHeight(context,4),),
                  Container(
                    // width: ScreenHelper.screenWidth(context, 180),
                    color: Colors.transparent,
                    child: CustomText(
                      text: 'mohanedtory97',
                      fontW: FW.light,
                      fontSize: 11,
                      overflow: true,
                      color: DARKBLACKCOLOR,
                    ),
                  ),
                  SizedBox(height: ScreenHelper.screenHeight(context,2),),
                  Container(
                    // width: ScreenHelper.screenWidth(context, 180),
                    color: Colors.transparent,
                    child: CustomText(
                      text: 'كلية هندسة - قسم مدني',
                      fontW: FW.light,
                      fontSize: 11,
                      overflow: true,
                      color: DARKBLACKCOLOR,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Column(
              children: [
                SizedBox(
                  height: ScreenHelper.screenHeight(context,25),
                ),
                Row(
                  children: [
                    IconCircular(icon: 'editphoto.png',),
                    SizedBox(width: ScreenHelper.screenWidth(context,6),),
                    IconCircular(icon: 'editinfo.png',),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
