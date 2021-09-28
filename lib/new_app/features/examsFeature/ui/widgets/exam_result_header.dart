import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:flutter/material.dart';


class ExamResultHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment : MainAxisAlignment.center,
      children: [
        Container(
          // height: ScreenHelper.screenHeight(context,319.71),
          width:  ScreenHelper.screenWidth(context,343),
          decoration: BoxDecoration(
              color: Color(0xff6D0AFF),
              borderRadius: BorderRadius.circular(ScreenHelper.screenHeight(context,15))
          ),
          child: Column(
            children: [
              SizedBox(
                height: ScreenHelper.screenHeight(context,25),
              ),
              Image.asset(
                'assets/icons/cong.png',
                height: ScreenHelper.screenHeight(context,143),
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context,25),
              ),
              CustomText(
                text: 'تهانينا ,حصلت علي مجموع 48 من 50 درجة',
                color: Colors.white,
                fontSize: 16,
                fontW: FW.semibold,
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context,24),
              ),
              UsedButton(
                title: 'إظهار الاجابات',
                widthFraction: 306,
                buttonColor: Color(0xff8D40FF),
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context,24),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
