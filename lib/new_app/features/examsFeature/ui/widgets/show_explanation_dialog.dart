import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';


class ShowExplanationDialog extends StatelessWidget {
  final Function onTap;


  ShowExplanationDialog({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  ScreenHelper.screenWidth(context,343),
      height: ScreenHelper.screenHeight(context,365.85),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ScreenHelper.screenHeight(context,15)),
        color: Color(0xff4F0BB3),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/tagat.png',
                height: ScreenHelper.screenHeight(context,110),
              ),
            ],
          ),
          SizedBox(
            height: ScreenHelper.screenHeight(context, 24),
          ),
          Container(
            width: ScreenHelper.screenWidth(context,300),
            child: CustomText(
              text: 'عذرا انت غير مشترك بهذه الخدمة',
              fontSize: 16,
              fontW: FW.semibold,
              color: Colors.white,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: ScreenHelper.screenHeight(context, 24),
          ),
          Container(
            width: ScreenHelper.screenWidth(context,300),
            child: CustomText(
              text: 'رقي الان الحساب الخاص بك و أستمتع بعديد من الميمزات',
              fontSize: 11,
              fontW: FW.semibold,
              color: Colors.white,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: ScreenHelper.screenHeight(context, 24),
          ),
          UsedButton(
            widthFraction: 306,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/tagdialog.png',
                  height: ScreenHelper.screenHeight(context, 25),
                ),
                SizedBox(
                  width: ScreenHelper.screenWidth(context,8.5),
                ),
                CustomText(
                  text: 'أشترك الأن',
                  color: Colors.white,
                  fontSize: 14,
                  fontW: FW.semibold,
                ),
              ],
            ),
            onTap:onTap ??(){},
            buttonColor: Color(0xff7629E8),
          ),
        ],
      ),
    );
  }
}
