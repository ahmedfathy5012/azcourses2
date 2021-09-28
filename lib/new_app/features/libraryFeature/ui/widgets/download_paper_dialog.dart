import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';


class DownloadPaperDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenHelper.screenWidth(context,343),
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
                'assets/icons/tagdialog.png',
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
              text: 'لتحميل الشرح قم بشراء المذكرة',
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
              text: 'قم بشراء المذكرة لتحميلها او مشاركتها ,او أشترك في باقة المذكرات',
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
            title: 'أدفع 10 نقاط',
            widthFraction: 306,
            onTap: (){},
            buttonColor: Color(0xff6B32BF),
          ),
        ],
      ),
    );
  }
}
